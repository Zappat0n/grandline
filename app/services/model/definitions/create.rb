class Model::Definitions::Create
  def initialize(user_id:, name:, y_variable:, data:, date_column:, description: nil)
    @data = data.split("\n")
    @description = description
    @date_column = date_column
    @name = name
    @user_id = user_id
    @y_variable = y_variable
  end

  def call
    ActiveRecord::Base.transaction do
      model_definition = Model::Definition.create!(user_id: user_id, name: name, description: description)

      x_variables.each do |variable|
        model_definition.variables.create!(name: variable.strip)
      end

      model_definition.data_points.create!(
        data.map { |line| data_point(line) }
      )

      { result: :ok }
    end
  rescue StandardError => e
    { error: "Failed to create model definition: #{e.message}" }
  end

  private

  attr_reader :user_id, :name, :data, :description, :y_variable, :date_column

  def variables
    @_variables ||= data.shift.split(",").flatten.uniq
  end

  def y_index
    @_y_index ||= variables.index(y_variable)
  end

  def date_column_index
    return @_date_column_index if defined?(@_date_column_index)

    @_date_column_index ||= variables.index(date_column)
  end

  def x_variables
    @_x_variables ||= (variables - [y_variable] - [date_column]).map(&:strip)
  end

  def data_point(line)
    values = line.split(",").map(&:strip)
    y = values[y_index]
    created_at = date_column_index ? values.delete_at(date_column_index) : Time.current
    values.delete(y)

    {
      created_at: created_at,
      y: y.to_f,
      x: x_variables.zip(values).to_h
    }
  end
end
