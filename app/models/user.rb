class User < ActiveRecord::Base


	has_many :surveys
	has_many :participations

	validates :email, presence: true, uniqueness: true
	validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
	validates :password, presence: true
	validates :password, length: { minimum: 8 }
	# validates :password, format: { with: /\A[\w+\-.]+\z/i}

  include BCrypt
  
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


# NO BORRAR: Active Record me da todos los siguientes métodos y más: 
# User.all
# User.new
# User.create
# User.destroy
# User.delete_all
# User.save
# User.count
# User.find


