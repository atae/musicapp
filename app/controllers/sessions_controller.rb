class SessionsController < ApplicationController
  #login page
  def new
    if logged_in?
      redirect_to bands_url
      return nil
    end
    render :new
  end

  #log in
  def create

    user = User.find_by_credentials(
      session_params[:email],
      session_params[:password]
    )
    if user.nil?
      render :new
      return nil
    elsif user.activated == false
      flash[:errors] = ["User found but not activated. Please activate your account in the email that was sent to your inbox."]
      redirect_to new_session_url
    elsif user.valid?
      login!(user)
      redirect_to bands_url
    else
      flash[:errors] = ["Incorrect Email or Password"]
      redirect_to new_session_url
    end
  end

  #log out
  def destroy
    user = current_user
    logout!(user)
    redirect_to new_session_url
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end

end
