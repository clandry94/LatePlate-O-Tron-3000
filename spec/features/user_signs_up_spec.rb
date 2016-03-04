require 'spec_helper'

feature 'User signs up' do
  scenario 'with valid email, phone number, and password'
    #user = FactoryGirl.build(:user)

    #visit signup_path
    #fill_in 'user_first_name', with: user.first_name
    #fill_in 'user_last_name', with: user.last_name
    #fill_in 'user_email_address', with: user.email_address
    #fill_in 'user_phone_number', with: user.phone_number
    #fill_in 'user_password', with: user.password
    #fill_in 'user_password_confirmation', with: user.password_confirmation

    # need expect still, success isn't implemented yet
  #end

  scenario 'with invalid email_address' do
    user = FactoryGirl.build(:user)

    visit signup_path
    fill_in 'user_first_name', with: user.first_name
    fill_in 'user_last_name', with: user.last_name
    fill_in 'user_email_address', with: 'testinvalid'
    fill_in 'user_phone_number', with: user.phone_number
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password_confirmation
    click_button 'Submit'

    expect(page).to have_content('error')

  end

  scenario 'without a phone_number' do
    user = FactoryGirl.build(:user)

    visit signup_path
    fill_in 'user_first_name', with: user.first_name
    fill_in 'user_last_name', with: user.last_name
    fill_in 'user_email_address', with: user.email_address
    fill_in 'user_phone_number', with: ''
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password_confirmation
    click_button 'Submit'

    expect(page).to have_content('error')
  end

  scenario 'without a valid phone_number' # not yet implemented


  scenario 'with a password that is too short (characters < 8)' do
    user = FactoryGirl.build(:user)

    visit signup_path
    fill_in 'user_first_name', with: user.first_name
    fill_in 'user_last_name', with: user.last_name
    fill_in 'user_email_address', with: user.email_address
    fill_in 'user_phone_number', with: user.phone_number
    fill_in 'user_password', with: 'badpass'
    fill_in 'user_password_confirmation', with: user.password_confirmation
    click_button 'Submit'

    expect(page).to have_content('error')
  end

  scenario 'with a password that does not match password_confirmation' do
    user = FactoryGirl.build(:user)

    visit signup_path
    fill_in 'user_first_name', with: user.first_name
    fill_in 'user_last_name', with: user.last_name
    fill_in 'user_email_address', with: user.email_address
    fill_in 'user_phone_number', with: user.phone_number
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: 'badpass'
    click_button 'Submit'

    expect(page).to have_content('error')
  end

  scenario 'and is logged in' do
    user = FactoryGirl.build(:user)

    visit signup_path
    fill_in 'user_first_name', with: user.first_name
    fill_in 'user_last_name', with: user.last_name
    fill_in 'user_email_address', with: user.email_address
    fill_in 'user_phone_number', with: user.phone_number
    fill_in 'user_password', with: user.password
    fill_in 'user_password_confirmation', with: user.password_confirmation
    click_button 'Submit'

    click_link 'Home'
    expect(page).to_not have_content('Log in')
  end

end
