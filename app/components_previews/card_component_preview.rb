# frozen_string_literal: true

class CardComponentPreview < ViewComponent::Preview
  def default
    render(CardComponent.new) do |component|
      component.with_header do
        "Header"
      end

      component.with_body do
        "Body"
      end

      component.with_footer do
        "Footer"
      end
    end
  end
end
