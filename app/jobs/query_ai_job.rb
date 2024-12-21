class QueryAiJob < ApplicationJob
  queue_as :default

  def perform(message)
    Messages::Create.new(
      user: message.receiver,
      message_params: {
        receiver: message.user,
        content: response(message)
      },
      broadcast: true
    ).call
  end

  def response(message)
    json_response = DeepInfra::Client.new.call(message.content)

    json_response.dig("choices", 0, "message", "content")
  end
end
