class Message < ApplicationRecord
  belongs_to :user
  belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"

  def self.channel_name(user_id, receiver_id)
    first_id = [user_id, receiver_id].min
    second_id = [user_id, receiver_id].max

    [:messages, first_id, second_id]
  end

  def channel_name
    Message.channel_name(user_id, receiver_id)
  end

  def other_user(current_user)
    user == current_user ? receiver : user
  end
end
