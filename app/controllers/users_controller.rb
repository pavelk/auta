class UsersController < ResourceController::Base
  
  add_crumb ('Registrace')
  
  before_filter :check_authentication, :except => [:new, :create]
  
end
