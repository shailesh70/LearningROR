module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def signed_in?
    p '---------------------------'
    p current_user.nil?
    p '============================'
    return !current_user.nil?

  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def sign_out
    @current_user = nil
    p '---------------------------sign out'
    p current_user.nil?
    p '============================'
    cookies.delete(:remember_token)
  end
end