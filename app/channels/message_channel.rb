class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "message_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def get_user_data
    data = {
      id: current_user.id,
      username: current_user.username
    }

    ActionCable.server.broadcast("message_channel", data)
  end
end
