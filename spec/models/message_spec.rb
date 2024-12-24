require "rails_helper"

RSpec.describe Message do
  describe "channel_name" do
    it "should return the correct channel name" do
      user = create(:user)
      user2 = create(:user, username: "user2")
      message = create(:message, user: user, receiver: user2)

      expect(message.channel_name).to eq([:messages, user.id, user2.id])
      expect(Message.channel_name(user.id, user2.id)).to eq([:messages, user.id, user2.id])
    end
  end

  describe "other_user" do
    it "should return the other user" do
      user = create(:user)
      user2 = create(:user, username: "user2")
      message = create(:message, user: user, receiver: user2)

      expect(message.other_user(user)).to eq(user2)
      expect(message.other_user(user2)).to eq(user)
    end
  end
end
