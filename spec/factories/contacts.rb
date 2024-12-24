FactoryBot.define do
  factory :contact do
    user
    contact { create(:user) }
  end
end
