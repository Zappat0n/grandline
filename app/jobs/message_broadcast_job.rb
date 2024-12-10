class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    return
    message = Message.find(message.id)
    ActionCable.server.broadcast(
      "message_channel",
      {
        html: ApplicationController.new.render_to_string(partial: "messages/message", locals: { message: message })
      }
    )
  end
end
