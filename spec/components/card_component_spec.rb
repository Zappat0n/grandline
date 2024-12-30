# frozen_string_literal: true

require "rails_helper"

RSpec.describe CardComponent, type: :component do
  it "renders the different sections" do
    component = described_class.new.tap do |c|
      c.with_header { "Header" }
      c.with_body { "Body" }
      c.with_list { "List" }
      c.with_footer { "Footer" }
    end

    expect(
      render_inline(component)
    )
      .to have_css(".card")
      .and have_css(".card-header")
      .and have_text("Header")
      .and have_css(".card-body")
      .and have_text("Body")
      .and have_text("List")
      .and have_css(".card-footer")
      .and have_text("Footer")
  end
end
