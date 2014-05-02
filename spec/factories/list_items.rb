# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :list_item do
    content "MyString"
    list_id 1
  end
end
