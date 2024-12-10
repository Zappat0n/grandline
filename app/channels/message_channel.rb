class MessageChannel < ApplicationCable::Channel
  def subscribed
    stream_from params[:room_name]
  end
end
