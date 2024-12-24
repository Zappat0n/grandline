FactoryBot.define do
  factory :user do
    username { |n| "user-#{n}" }
    password { "password" }
    ai  { false }
  end
end
