# frozen_string_literal: true

class MessageComponentPreview < ViewComponent::Preview
  def index_message
    user = User.new(username: "John Doe")
    receiver = User.new(username: "Jane Doe")
    message = Message.new(user: user, receiver: receiver, content: "Hello, Jane!", created_at: Time.current)

    render(MessageComponent.new(
      message: message,
      user: user,
      index_message: true
    ))
  end

  def message_from_me
    user = User.new(username: "John Doe")
    receiver = User.new(username: "Jane Doe")
    message = Message.new(user: user, receiver: receiver, content: "Hello, Jane!", created_at: Time.current)

    render(MessageComponent.new(
      message: message,
      user: user,
      index_message: false
    ))
  end

  def message_from_receiver
    user = User.new(username: "John Doe")
    receiver = User.new(username: "Jane Doe")
    message = Message.new(user: user, receiver: receiver, content: "Hello, Jane!", created_at: Time.current)

    render(MessageComponent.new(
      message: message,
      user: receiver,
      index_message: false
    ))
  end
end
