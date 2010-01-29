class User < ActiveRecord::Base
  
  has_many :user_rounds
  has_many :rounds, :through => :user_rounds
  
  acts_as_authentic do |c|
    c.login_field = 'email'
    c.validates_length_of_password_field_options = { :minimum => 5 }
  end
  
  def activate_account!
    reset_perishable_token!
    Notifier.deliver_activate_account(self)
  end
  
  def activate!
      self.active = true
      save
  end 
  
end
