require "rails_helper"

RSpec.describe "Creates a chat message", type: :feature, js: true do
  include ActiveJob::TestHelper

  around do |example|
    perform_enqueued_jobs do
      example.run
    end
  end

  it "creates a chat message" do
    user = create(:user)
    receiver = create(:user)
    create(:contact, user: user, contact: receiver)
    create(:message, content: "Old message", user: user, receiver: receiver)

    sign_in user
    visit message_path(receiver)

    expect(page).to have_text("Old message")

    fill_in "new-message-content", with: "New message"
    click_button "Submit"

    expect(find(".messages")).to have_text("New message")
    expect(Message.last.content).to eq("New message")
    expect(find("#new-message-content").value).to be_empty
  end
end
