# frozen_string_literal: true

require "rails_helper"

RSpec.describe MessageComponent, type: :component do
  it "renders the different sections when index_message is false" do
    user = create(:user, username: "johny")
    receiver = create(:user, username: "michael")
    message = create(:message, user: user, receiver: receiver)

    rendered_component = render_inline(
      described_class.new(
        user: user,
        message: message,
        index_message: false
      )
    )

    expect(rendered_component)
      .to have_css(".light-blue-bg")
      .and have_text(message.content)

    expect(rendered_component)
      .not_to have_css(".avatar")
  end

  it "renders the different sections when index_message is true" do
    user = create(:user, username: "johny")
    receiver = create(:user, username: "michael")
    message = create(:message, user: user, receiver: receiver)

    rendered_component = render_inline(
      described_class.new(
        user: user,
        message: message,
        index_message: true
      )
    )

    expect(rendered_component)
      .to have_css(".light-blue-bg")
      .and have_text(message.content)
      .and have_css(".avatar")
  end
end
