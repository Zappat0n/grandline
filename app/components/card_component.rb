# frozen_string_literal: true

class CardComponent < ViewComponent::Base
  renders_one :header
  renders_one :body
  renders_one :list
  renders_one :footer

  def initialize(no_padding: false)
    @no_padding = no_padding
  end

  private

  attr_reader :no_padding

  def padding_css_class
    no_padding ? "p-0" : ""
  end
end
