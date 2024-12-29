require "rails_helper"

RSpec.describe User, type: :model do
  context "validations" do
    it "is valid with valid attributes" do
      expect(build(:user)).to be_valid
    end

    it "is not valid without a username" do
      expect(build(:user, username: nil)).to_not be_valid
    end

    it "is valid with a blank email" do
      expect(build(:user, email: nil)).to be_valid
    end

    it "is not valid with a duplicate username" do
      user = create(:user)
      expect(build(:user, username: user.username)).to_not be_valid
    end

    it "is not valid with a duplicated email" do
      user = create(:user, email: "my_email@this.com")
      expect(build(:user, email: user.email)).to_not be_valid
    end
  end

  context "scopes" do
    it "has a scope called ai_models" do
      expect(User.ai_models).to eq(User.where(ai: true))
    end
  end

  describe "conversation_with(user)" do
    it "returns the right messages" do
      user = create(:user)
      user2 = create(:user)
      message = create(:message, user: user, receiver: user2)
      message2 = create(:message, user: user2, receiver: user)

      expect(user.conversation_with(user2).to_a).to eq([message, message2])
    end
  end

  describe "ai_models" do
    it "returns the right users" do
      user = create(:user)
      user2 = create(:user, ai: true)
      user3 = create(:user, ai: false)
      create(:contact, user: user, contact: user2)
      create(:contact, user: user, contact: user3)

      expect(user.ai_models.to_a).to eq([user2])
    end
  end
end
