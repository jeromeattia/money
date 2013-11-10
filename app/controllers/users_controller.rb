# encoding: UTF-8
class UsersController < ApplicationController
  before_filter :signed_in_user, :only => [:edit, :update,:index,:show]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy

  def index
    @users = User.find(:all)
  end

  def show
    @user = User.find(params[:id])
     #UserMailer.welcome(@user).deliver
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Bienvenue dans MoneyMoney!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    #@user = User.find(params[:id])
    #@title = "Edit user"
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:notice] = "Profil mis à jour."
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Utilisateur supprimé."
    redirect_to users_path
  end

  def omniauth_failure
    redirect_to "/signin"
    #redirect wherever you want.
  end
 
  private
    
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
