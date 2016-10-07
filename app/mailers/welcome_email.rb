class WelcomeEmail < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url = "http://localhost:3000/users/activate?activation_token=#{user.activation_token}"
    mail(to: "#{user.email}", subject: 'Activate Your Account @ MusicApp!')
  end
end
