require 'spec_helper'

feature 'User logs in' do
  scenario 'with valid email and password'

    #visit login_path

    #fill_in 'session_email_address', with: 'clandry94@ufl.edu'
    #fill_in 'session_password', with: 'password0'
    #click_button 'Log in'
    #need expect still, success not implemented
  #end

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

end
