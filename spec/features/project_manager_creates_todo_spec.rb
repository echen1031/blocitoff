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

  scenario 'With description missing' do
    visit new_list_path
    click_button 'Save'
    expect( page ).to have_content('Error: you should have content in description')
  end
end

feature 'Visitor signs up' do
  scenario 'With valid email and password' do
    sign_up_with 'valid@example.com', 'password', 'password'

    expect( page ).to have_content('Sign out')
  end

  scenario 'With invalid email' do
    sign_up_with 'invalid_email', 'password', 'password'

    expect( page ).to have_content('Sign in')
  end

  scenario 'With blank password' do
    sign_up_with 'valid@example.com', '', ''

    expect( page ).to have_content('Sign in')
  end

  def sign_up_with(email, password, password_confirm)
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'
  end

end


