require "rails_helper"

RSpec.describe User, type: :model do
  it "should have a scope called ai" do
    expect(User.ai).to eq(User.where(ai: true))
  end

  it "should have a conversation_with method" do
    user = create(:user)
    user2 = create(:user, username: "user2")
    message = create(:message, user: user, receiver: user2)
    message2 = create(:message, user: user2, receiver: user)

    expect(user.conversation_with(user2).to_a).to eq([message, message2])
  end

  it "should have a private method called email_required?" do
    user = create(:user)
    expect(user.send(:email_required?)).to eq(false)
  end
end
