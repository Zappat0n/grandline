# frozen_string_literal: true

class MessageComponent < ViewComponent::Base
  def initialize(user:, message:, index_message: false)
    @user = user
    @message = message
    @index_message = index_message
  end

  private

  attr_reader :user, :message, :index_message

  def align_and_mx
    index_message || message.user != user ? "ms-2 me-5" : "float-end ms-5 me-2"
  end

  def background_color
    message.user == user ? "light-blue-bg" : "light-gray-bg"
  end
end
