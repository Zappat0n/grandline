# frozen_string_literal: true

class MessageComponent < ViewComponent::Base
  MAX_LENGTH = 300

  def initialize(user:, message:, index_message: false)
    @user = user
    @message = message
    @index_message = index_message
  end

  private

  attr_reader :user, :message, :index_message

  def align_and_mx
    index_message || message.user != user ? "ms-0 ms-md-2 me-3 me-md-5" : "float-end ms-3 ms-md-5 me-0 me-md-2"
  end

  def background_color
    message.user == user ? "light-blue-bg" : "light-gray-bg"
  end

  def content
    index_message ? message.content.truncate(MAX_LENGTH, separator: " ") : message.content
  end
end
