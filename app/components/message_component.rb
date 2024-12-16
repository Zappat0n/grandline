# frozen_string_literal: true

class MessageComponent < ViewComponent::Base
  def initialize(user:, message:, index_message: false)
    @user = user
    @message = message
    @index_message = index_message
  end

  private

  attr_reader :user, :message, :index_message

  def align
    index_message || message.user != user ? "" : "float-end"
  end

  def background_color
    message.user == user ? "light-blue-bg" : "light-gray-bg"
  end
end
