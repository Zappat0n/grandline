FactoryBot.define do
  factory :message do
    content { "Hello" }
    user
    receiver { create(:user) }
  end
end
