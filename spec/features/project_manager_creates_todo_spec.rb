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
    fill_in 'Description', with: 'Meet up with the team'
    click_button 'Save'
    expect( page ).to have_content('Your new To-do list was saved')
    expect( page ).to have_content('Meet up with the team')
  end

  scenario 'With description missing' do
    sign_in(user.email, user.password)
    visit new_list_path
    fill_in 'Description', with: ''
    click_button 'Save'
    expect( page ).to have_content('Error creating To-do list')
  end
end


