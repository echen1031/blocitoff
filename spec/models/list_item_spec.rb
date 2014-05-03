require 'spec_helper'

describe ListItem do

  it 'Should not allow blank content' do
    list_item = ListItem.create(content: '', list_id: 1)
    list_item.should_not be_valid
  end

  it 'should not have the same content' do
    item = FactoryGirl.create(:list_item)
    same_name_list_item = ListItem.create( :content =>item.content)

    same_name_list_item.should have(1).errors_on(:content)
  end

  it 'should delete after 7 days' do
    list_item = FactoryGirl.create(:list_item, created_at: 8.days.ago)
    expect(list_item).to be_deleted
  end

  it 'should always belong to a list' do
    list = ListItem.create( list_id: '', content: 'No List id')
    list.should_not be_valid
  end
end
