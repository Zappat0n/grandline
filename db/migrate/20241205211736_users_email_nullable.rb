class UsersEmailNullable < ActiveRecord::Migration[8.0]
  def change
    change_column :users, :email, :string, null: true
  end
end
