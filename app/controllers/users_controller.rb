class UsersController < ApplicationController
  before_action :logged_in_user, only: :show
  before_action :admin_user,     only: [:index, :edit, :update]

include EntriesHelper

  def index
    @users = User.all.order(:name)
  end

  def show
    @user = User.find(params[:id])
    @entries = @user.entries
    split_entries(@entries)
    @entry = current_user.entries.build if logged_in?

    if @user == current_user
      @title1 = "Your Queue"
      @title2 = "Your Archive"
    else
      @title1 = "#{@user.name}'s Queue"
      @title2 = "#{@user.name}'s Archive"
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      # flash[:success] = "Account successfully created! Please check your email to activate."
      flash[:success] = "Account successfully created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to request.referrer || root_url
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:success] = "User successfully updated."
    redirect_to edit_user_path(@user)
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :department, :password, :password_confirmation)
    end
end
