class Messages::Create
  def initialize(user:, message_params:, broadcast_to: nil)
    @user = user
    @message_params = message_params
    @broadcast_to = broadcast_to
  end

  def call
    message = user.messages.create!(message_params)
    broadcast_to_channel(message) if broadcast_to
    message
  end

  private

  attr_reader :user, :message_params, :broadcast_to

  def broadcast_to_channel(message)
    message.broadcast_append_later_to(message.channel_name, locals: { user: broadcast_to })
  end
end
