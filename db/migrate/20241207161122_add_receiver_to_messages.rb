class AddReceiverToMessages < ActiveRecord::Migration[8.1]
  def change
    add_column :messages, :receiver_id, :bigint
    add_foreign_key :messages, :users, column: :receiver_id
  end
end
