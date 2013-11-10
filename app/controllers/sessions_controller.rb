# encoding: UTF-8
class SessionsController < ApplicationController

  def new
  end

  def create
    liste = User.all.collect{|u| u.email}
    user  = User.from_omniauth(env["omniauth.auth"])
    if user && liste.include?(user.email)
      session[:user_id] = user.id
      sign_in user
      redirect_to protocoles_path, notice: "Bienvenue #{user.name} !"
    else
      flash[:alert] = "Désolé, utilisateur inconnu - pas d'accés."
      user.delete
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end
  
  def failure
    redirect_to "/signin", :alert => "Mot de passe erroné ou utilisateur inconnu."
  end
end
