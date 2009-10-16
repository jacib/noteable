class AddUserAndAdminRole < ActiveRecord::Migration
  def self.up
    
    admin_role = Role.create(:name => "admin")
    user_role = Role.create(:name => "user")
    
  end

  def self.down
    
    Role.find_by_name("admin").destroy!
    Role.find_by_name("user").destroy!
    
  end
end
