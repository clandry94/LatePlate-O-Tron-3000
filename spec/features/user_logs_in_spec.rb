require 'spec_helper'

feature 'User logs in' do
  scenario 'with valid email and password'

  # visit login_path

  # fill_in 'session_email_address', with: 'clandry94@ufl.edu'
  # fill_in 'session_password', with: 'password0'
  # click_button 'Log in'
  # need expect still, success not implemented
  # end

  scenario 'with invalid email_address' do
    visit login_path
    fill_in 'session_email_address', with: 'clandry@invalid'
    fill_in 'session_password', with: 'password0'
    click_button 'Log in'

    expect(page).to have_content('Invalid')
  end

  scenario 'with invalid password' do
    visit login_path
    fill_in 'session_email_address', with: 'clandry94@ufl.edu'
    fill_in 'session_password', with: 'badpassword'
    click_button 'Log in'

    expect(page).to have_content('Invalid')
  end

  scenario 'and the login button disappears on the home page' do
    user = FactoryGirl.create(:user)
    visit login_path
    fill_in 'session_email_address', with: user.email_address
    fill_in 'session_password', with: user.password
    click_button 'Log in'

    expect(page).to_not have_content('Log in')
  end

  scenario 'and the signup button disappears' do
    user = FactoryGirl.create(:user)
    visit login_path
    fill_in 'session_email_address', with: user.email_address
    fill_in 'session_password', with: user.password
    click_button 'Log in'

    expect(page).to_not have_content('Sign Up')
  end

  scenario 'and the view profile button appears' do
    user = FactoryGirl.create(:user)
    visit login_path
    fill_in 'session_email_address', with: user.email_address
    fill_in 'session_password', with: user.password
    click_button 'Log in'

    expect(page).to have_content('View Profile')
  end

  scenario 'and the Manage LatePlates button appears' do
    user = FactoryGirl.create(:user)
    visit login_path
    fill_in 'session_email_address', with: user.email_address
    fill_in 'session_password', with: user.password
    click_button 'Log in'

    expect(page).to have_content('Manage LatePlates')
  end

  scenario 'and the settings button appears' do
    user = FactoryGirl.create(:user)
    visit login_path
    fill_in 'session_email_address', with: user.email_address
    fill_in 'session_password', with: user.password
    click_button 'Log in'

    expect(page).to have_content('Settings')
  end

  scenario 'and clicks the log out button' do
    user = FactoryGirl.create(:user)
    visit login_path
    fill_in 'session_email_address', with: user.email_address
    fill_in 'session_password', with: user.password
    click_button 'Log in'
    click_link 'Log out'

    expect(page).to have_content('Log in')
  end
end
