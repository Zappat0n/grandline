class CreateModelData < ActiveRecord::Migration[8.0]
  def change
    create_table :model_data_points do |t|
      t.references :model_definition, null: false, foreign_key: true
      t.float :y, null: false
      t.json :x, null: false
      t.timestamps
    end
  end
end
