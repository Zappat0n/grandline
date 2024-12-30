# frozen_string_literal: true

class CardListComponent < ViewComponent::Base
  renders_many :items

  def initialize(no_items_message:)
    @no_items_message = no_items_message
  end

  private

  attr_reader :no_items_message
end
