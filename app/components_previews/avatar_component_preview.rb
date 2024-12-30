# frozen_string_literal: true

class AvatarComponentPreview < ViewComponent::Preview
  def default
    render(
      AvatarComponent.new(
        user: User.new(
          username: "John Doe",
        )
      )
    )
  end
end
