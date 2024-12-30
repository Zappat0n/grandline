# frozen_string_literal: true

class CardListComponentPreview < ViewComponent::Preview
  def with_items
    contacts = [
      User.new(username: "John Doe"),
      User.new(username: "Jane Doe"),
      User.new(username: "John Smith")
    ]

    render(CardListComponent.new(no_items_message: "No items")) do |component|
      contacts.each do |user|
        component.with_item do
          user.username
        end
      end
    end
  end

  def without_items
    render(CardListComponent.new(no_items_message: "No items"))
  end
end
