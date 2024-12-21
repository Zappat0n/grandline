class Messages::Create
  def initialize(user:, message_params:, broadcast: false)
    @user = user
    @message_params = message_params
    @broadcast = broadcast
  end

  def call
    message = user.messages.create!(message_params)
    broadcast_to_channel(message) if broadcast
    message
  end

  private

  attr_reader :user, :message_params, :broadcast

  def broadcast_to_channel(message)
    message.broadcast_append_later_to(message.channel_name, locals: { user: user })
  end
end
