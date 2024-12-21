class MessagesContentConvertToText < ActiveRecord::Migration[8.1]
  def change
    change_column :messages, :content, :text
  end
end
