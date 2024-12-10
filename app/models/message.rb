class Message < ApplicationRecord
  belongs_to :user
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"

  def self.room_name(user_id, receiver_id)
    first_id = [user_id, receiver_id].min
    second_id = [user_id, receiver_id].max

    "room_#{first_id}_#{second_id}"
  end

  def room_name
    Message.room_name(user_id, receiver_id)
  end
end
