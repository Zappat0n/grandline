class CreateModelVariables < ActiveRecord::Migration[8.0]
  def change
    create_table :model_variables do |t|
      t.references :model_definition, null: false, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.timestamps
    end
  end
end
