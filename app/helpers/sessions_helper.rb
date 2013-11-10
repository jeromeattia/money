module SessionsHelper

  def signed_in?
    !current_user.nil?
  end

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def sign_out
    current_user = nil
    cookies.delete(:remember_token)    
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
     @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def deny_access
    redirect_to signin_path, :notice => "Connection requise pour acceder a cette page."
  end
  def current_user?(user)
    user == current_user
  end
def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    clear_return_to
  end

   def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end

  def store_location
    session[:return_to] = request.url
  end

  private
   # def store_location
   #    session[:return_to] = request.fullpath
   #  end

    def clear_return_to
      session[:return_to] = nil
    end
end
