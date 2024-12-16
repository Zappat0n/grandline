# frozen_string_literal: true

class AvatarComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end

  private

  attr_reader :user

  def initials
    return "GUE" unless user.username.present?

    user.username[0, 3].upcase
  end
end
