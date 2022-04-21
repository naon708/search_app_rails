FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "ニックネーム-#{n}" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
