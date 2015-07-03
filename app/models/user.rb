class User < ActiveRecord::Base


has_many :surveys
has_many :participations



# Validaciones

 validates :email, presence: true, uniqueness: true
 validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
 validates :password, presence: true
 validates :password, length: { minimum: 8 }
 validates :password, format: { with: /[a-zA-Z]+\d+/}


# NO BORRAR: Active Record me da todos los isguientes métodos y más: 
# User.all
# User.new
# User.create
# User.destroy
# User.delete_all
# User.save
# User.count
# User.find

end


