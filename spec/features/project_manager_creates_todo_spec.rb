require 'spec_helper'

# PM goes to the TODO creation page
# PM submits new TODO description
# PM sees confirmation message
# PM sees newly saved TODO


feature 'Project manager creates TODO list' do
  
  let(:user) { FactoryGirl.create(:user)}

  scenario 'successfully' do
    sign_in(user.email, user.password)
    visit new_list_path
    fill_in 'Start a To-do list here', with: 'Yard work'
    click_button 'Save'
    expect( page ).to have_content('Your new To-do list was saved')
    expect( page ).to have_content('Yard work')
  end

  scenario 'With description missing' do
    sign_in(user.email, user.password)
    visit new_list_path
    fill_in 'Start a To-do list here', with: ''
    click_button 'Save'
    expect( page ).to have_content('Error creating To-do list')
  end
end

feature 'Project manager creates a TODO list with an item' do

  let(:user) { FactoryGirl.create(:user)}

  scenario 'succssfully' do
    sign_in(user.email, user.password)
    visit new_list_path
    fill_in 'Start a To-do list here', with: 'Garden Work'
    click_link('Add item')
    fill_in 'Add your items here', with: 'Mow the lawn'
    click_button 'Save list'
    expect( page ).to havwe_content('Your new item was created')
  end
end


