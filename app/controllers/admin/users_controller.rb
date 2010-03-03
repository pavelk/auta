class Admin::UsersController < Admin::AdminController
  def index
      @collection = User.all.paginate :page => params[:page]
  end
  
end
