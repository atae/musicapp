class UsersController < ApplicationController

  def new
    render :new
  end

  def activate
    user = User.find_by(activation_token: params[:activation_token])
    if user.nil?
      flash[:errors]=["Token not found!"]
      render :new
    elsif user.activated == false
      user.activated = true
      user.save!
      flash[:errors]=["You have been activated! Please sign in."]
      render :new
    else
      flash[:errors]=["You have already been activated! Please sign in."]
      render :new
    end
  end

  def create
    user = User.new(user_params)
    if user.valid?
      user.save
      user.generate_activation_token!
      msg = WelcomeEmail.welcome_email(user)
      msg.deliver
      flash.now[:errors] << ["Your activation email is coming. Please activate your account."]
      render :new
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end

  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end
end
