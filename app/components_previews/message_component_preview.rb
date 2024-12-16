# frozen_string_literal: true

class MessageComponentPreview < ViewComponent::Preview
  def default
    render(MessageComponent.new)
  end
end
