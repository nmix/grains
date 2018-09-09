require 'rails_helper'

RSpec.feature 'Signing in/out process', :type => :feature do

  let(:user) { create(:user) }

  scenario 'user signing in' do

    visit '/users/sign_in'

    within('#new_user') do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: '12345678'
    end

    click_button 'Log in'

    expect(page).to have_content 'Signed in successfully'

  end

  scenario 'user signing out' do

    login_as(user, :scope => :user)

    visit '/dashboard/index'

    click_link 'Sign Out'

    expect(page).to have_content 'Signed out successfully'

  end

end
