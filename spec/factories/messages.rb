FactoryBot.define do
  factory :message do
    content { |n| "content-#{n}" }
    user
    receiver { create(:user) }
  end
end
