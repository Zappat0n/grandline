class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    message = Message.find(message.id)
    ActionCable.server.broadcast(
      message.room_name,
      {
        html: ApplicationController.new.render_to_string(partial: "messages/message", locals: { message: message, user: message.user })
      }
    )
  end
end
