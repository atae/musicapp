class User < ActiveRecord::Base
  validates :email, :session_token, uniqueness:true, presence:true
  validates :password_digest, presence:{message: "Password can't be blank"}
  validates :password, length: {minimum: 6, allow_nil: true}
  after_initialize :ensure_session_token

  attr_reader :password

  def self.find_by_credentials(email, password)
    @user ||= User.find_by(email: email)
    return nil if @user.nil?

    @user.is_password?(password) ? @user : nil
  end

  def generate_activation_token!
    self.activation_token = SecureRandom::urlsafe_base64
    self.save!
  end

  def generate_session_token
    SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    self.session_token = generate_session_token
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    bcrypt_object = BCrypt::Password.new(self.password_digest)
    bcrypt_object.is_password?(password)
  end


  private
  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end

end
