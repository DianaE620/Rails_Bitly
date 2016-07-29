class User < ActiveRecord::Base

  validates :name, presence: { message: 'Tienes que ingresar tu nombre' } 
  validates :email, presence: { message: 'Tienes que ingresar tu email' }
  validates :password, presence: { message: 'Tienes que ingresar una contraseña' }
  validates :email,  uniqueness: { message: 'El email ya fue registrado' }

  include BCrypt

  has_many :urls

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(user_password)
    @password = Password.create(user_password)
    self.password_digest = @password
  end

  def self.authenticate(email, user_password)
    user = User.find_by(email: email)
    if user && (user.password == user_password)
      return user
    else
      nil
    end
  end

end
