class Message < ApplicationRecord
  belongs_to :user
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"

  def channel_name
    first_id = [user_id, receiver_id].min
    second_id = [user_id, receiver_id].max

    "message_channel"
    # "message_channel_#{first_id}_#{second_id}"
  end
end
