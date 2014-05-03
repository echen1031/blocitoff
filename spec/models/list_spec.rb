require 'spec_helper'

describe List do
  let(:user) { FactoryGirl.create(:user)}

  it 'should have a unique name' do
    list = List.create(user: user, description: 'wassup')
    same_name_list = List.create(user: user,:description => list.description)

    same_name_list.should have(1).errors_on(:description)
  end

  it 'should not be valid without a user' do
    no_user_list = List.new(:user_id => nil, description: 'hello')
    no_user_list.should have(1).errors_on(:user)
  end

  it 'should have a default item' do
    list = List.create(user: user, description: 'wassup')
    list.list_items.count.should eq 1
    #list without an item should be false
  end
end


