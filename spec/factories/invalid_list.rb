FactoryGirl.define do
  factory :invalid_list, parent: :list do
    description nil
    user 
  end 
end
