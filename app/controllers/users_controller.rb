class UsersController < ResourceController::Base
  
  add_crumb ('Registrace')
  
  before_filter :check_authentication, :except => [:new, :create, :reg_notice]
  
  create.wants.html do
    @user.activate_account!
    redirect_back_or_default reg_notice_user_path(@user) 
  end
  create.flash "Vas ucet byl vytvoren."
  
  def reg_notice
    @user =  User.find(params[:id])
  end
  
end
