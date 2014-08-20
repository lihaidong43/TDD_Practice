require 'spec_helper'

feature 'User management' do
  let(:admin){create(:admin)}


  scenario 'should adds a new user',:js => true do
    sign_in(admin)
    visit users_path
    click_link 'New'
    fill_in 'Email',:with =>  'lihaidong@163.com'
    fill_in 'Password',:with => 'secret123'
    click_button 'Create User'
    expect(page).to have_content 'User was successfully created'

  end

  context 'Login' do
    let(:user){create(:user)}
    let(:invalid_user){build(:user,:email => 'NotExist@163.com',:password => 'secret123')}

    scenario 'should login with exist user and password',:js => true do
      visit new_sessions_path
      fill_in 'user_email',:with => user.email
      fill_in 'user_password',:with => user.password
      click_button 'Sign in'
      expect(page).to have_content 'Login successfully'
    end


    scenario 'should not login with that does not exist user',:js => true  do
      visit new_sessions_path
      fill_in 'user_email',:with => invalid_user.email
      fill_in 'user_password',:with => invalid_user.password
      click_button 'Sign in'
      expect(page).to have_content "User #{invalid_user.email} does not exist! or password was wrong!"
    end
  end

  context 'Password' do
    scenario 'should reset',:focus => true,:js => true do
      sign_in(admin)
      user = build(:user)
      visit new_sessions_path
      click_link 'Reset Password'
      fill_in 'user_old_password',:with => user.password
      fill_in 'user_password',:with => '123456'
      click_button 'Reset'
      expect(page).to have_content "User #{admin.email}'s password already reset"
    end

  end

end