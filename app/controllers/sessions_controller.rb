class SessionsController < ApplicationController
  #login page
  def new
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
    end
    
    if user.valid?
      login!(user)
      redirect_to user_url(user)
    else
      flash[:errors] = ["Incorrect Email or Password"]
      redirect_to :new
    end
  end

  #log out
  def destroy
    user = current_user
    logout!(user)
    render :new
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end

end
