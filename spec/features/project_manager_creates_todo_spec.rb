require 'spec_helper'

# PM goes to the TODO creation page
# PM submits new TODO description
# PM sees confirmation message
# PM sees newly saved TODO

feature 'Project manager creates TODO list' do
  scenario 'successfully' do
    visit new_list_path
    fill_in 'Description', with: 'Meet up with the team'
    click_button 'Save'
    expect( page ).to have_content('Your new TODO list was saved')
    expect( page ).to have_content('Meet up with the team')
  end
end
