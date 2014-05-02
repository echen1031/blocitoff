module Features
  module SessionHelpers

    def sign_in(username, password)
      visit new_user_session_path
      fill_in "Email", with: username
      fill_in "Password", with: password
      click_button "Sign in"
    end

  end
end
