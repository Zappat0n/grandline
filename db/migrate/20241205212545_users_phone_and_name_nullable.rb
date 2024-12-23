class UsersPhoneAndNameNullable < ActiveRecord::Migration[8.0]
  def change
    change_column :users, :phone, :string, null: true
    change_column :users, :name, :string, null: true
  end
end
