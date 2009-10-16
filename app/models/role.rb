class Role < ActiveRecord::Base
  has_and_belongs_to_many :users
  
  def self.user_role
    self.find_by_name("user")
  end
  
  def self.admin_role
    self.find_by_name("admin")
  end
  
end