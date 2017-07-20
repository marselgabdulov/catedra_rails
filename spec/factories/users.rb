FactoryGirl.define do
  factory :user do
    password "password"
    sequence(:email) { |i| "example#{i}@gmail.com"}
  end
end
