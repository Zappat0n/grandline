class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast(
      message.room_name,
      {
        user_id: message.user_id,
        html: ApplicationController.new.render_to_string(partial: "messages/message", locals: { message: message, user: message.user })
      }
    )
  end
end
