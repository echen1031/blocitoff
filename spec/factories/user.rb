
FactoryGirl.define do
  factory :user do
    sequence(:email, 100) {|n| "person#{n}@example.com" }
    password "helloworld"
    password_confirmation "helloworld"
  end
end
