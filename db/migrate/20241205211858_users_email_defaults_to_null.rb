class UsersEmailDefaultsToNull < ActiveRecord::Migration[8.0]
  def change
    change_column :users, :email, :string, default: nil
  end
end
