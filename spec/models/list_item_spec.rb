require 'spec_helper'

describe ListItem do
  let(:user) { FactoryGirl.create(:user)}

  it "Should not allow blank content" do
    list_item = ListItem.create(content: "", list_id: 1)
    list_item.should_not be_valid
  end

  it "should not have the same name" do
    list = ListItem.create( user: user, list_id: 2, content: "helloworld")
    same_name_list_item = ListItem.create(user: user, list_id: 3, :content =>list.content)

    same_name_list_item.should have(1).errors_on(:content)
  end

  it "should delete after 7 days" do
    pending
    list = FactoryGirl.create(:list_item)
    list.delete
 
  end

  it "should always belong to a list" do
    list = ListItem.create( list_id: '', content: "No List id")
    list.should_not be_valid
  end

  it 'should not be valid without a user' do
    no_user_list_item = ListItem.new(:user_id => nil, content: "hello", list_id: '4')
    no_user_list_item.should have(1).errors_on(:user)
  end
end
