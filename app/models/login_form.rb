class LoginForm < PassiveModel  
  column :login
  column :password
  column :remember_me
  
  validates_presence_of :login, :password
end