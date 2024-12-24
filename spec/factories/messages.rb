FactoryBot.define do
  factory :message do
    content { "Hello" }
    user
    receiver { create(:user, username: "receiver") }
  end
end
