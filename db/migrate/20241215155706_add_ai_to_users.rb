class AddAiToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :ai, :boolean, default: false
  end
end
