# frozen_string_literal: true

require "rails_helper"

RSpec.describe CardListComponent, type: :component do
  context "with items" do
    it "renders the items" do
      contacts = [
        User.new(username: "John Doe"),
        User.new(username: "Jane Doe"),
        User.new(username: "John Smith")
      ]

      component = described_class.new(no_items_message: "No items").tap do |c|
        contacts.each do |user|
          c.with_item { user.username }
        end
      end

      expect(
        render_inline(component)
      )
        .to have_css(".list-group")
        .and have_css(".list-group-item", count: 3)
        .and have_text("John Doe")
        .and have_text("Jane Doe")
        .and have_text("John Smith")
    end
  end

  context "without items" do
    it "renders the no items message" do
      component = described_class.new(no_items_message: "No items")

      expect(
        render_inline(component)
      )
        .to have_text("No items")
    end
  end
end
