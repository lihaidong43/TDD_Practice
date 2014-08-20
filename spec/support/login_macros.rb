module LoginMacros
  def set_user_session(user)
    session[:user_id] = user.id
  end

  def sign_in(user)
    visit new_sessions_path
    fill_in 'user_email',:with => user.email
    fill_in 'user_password',:with => user.password
    click_button 'Sign in'
  end
end