# frozen_string_literal: true

require "rails_helper"

RSpec.describe AvatarComponent, type: :component do
  it "renders the different sections" do
    user = create(:user, username: "johny")

    component = described_class.new(user: user)

    expect(
      render_inline(component)
    )
      .to have_css(".avatar")
      .and have_text("JOH")
  end
end
