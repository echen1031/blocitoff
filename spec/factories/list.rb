
FactoryGirl.define do
  factory :list do
    sequence(:description, 100) {|n|  "blah #{n}blah"}
    user
  end
end
