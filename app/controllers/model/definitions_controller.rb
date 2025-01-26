class Model::DefinitionsController < ApplicationController
  before_action :authenticate_user!

  def create
    result = Model::Definitions::Create.new(
      data: model_definition_params[:file_content],
      date_column: model_definition_params[:date_column],
      description: model_definition_params[:description],
      name: model_definition_params[:name],
      user_id: current_user.id,
      y_variable: model_definition_params[:y_variable],
    ).call

    if result.fetch(:error, nil)
      redirect_to new_model_definition_path, alert: result[:error]
    else
      redirect_to new_model_definition_path, notice: "Model definition created"
    end
  end

  def new
  end

  def index
    render locals: {
      models: current_user.models
    }
  end

  def show
    render locals: {
      model: current_user.models.find(params[:id])
    }
  end

  private

  def model_definition_params
    params.require(:model_definition).permit(:name, :description, :file_content, :y_variable, :date_column)
  end
end
