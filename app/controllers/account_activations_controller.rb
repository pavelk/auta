class AccountActivationsController < ApplicationController
  
  before_filter :check_authentication, :except => [:show]
  #before_filter :load_user_using_perishable_token, :only => [:show]
  
  def edit
    render
  end
  
  def show
    #debugger
    @user = User.find_using_perishable_token(params[:id], 0)
    @user.activate!
    UserSession.create(@user)
    #@user.active = true
    #@user.save!
    #if @user.save
      flash[:notice] = "Account activated"
      #prihlasit uzivatele
      #UserSession.create(@user)
      redirect_to root_url
    #else
    #  render :action => :edit
    #end
  end
  
  private
  
    def load_user_using_perishable_token
      @user = User.find_using_perishable_token(params[:id], 2.hours)
      unless @user
        flash[:notice] = "We're sorry, but we could not locate your account." +
          "If you are having issues try copying and pasting the URL " +
          "from your email into your browser or restarting the " +
          "reset password process."
        redirect_to root_url
      end
    end
  
end
