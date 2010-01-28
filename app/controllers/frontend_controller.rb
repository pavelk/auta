class FrontendController < ResourceController::Base
  
  actions :all, :except => [:new, :edit, :create, :update, :destroy]
  
  before_filter :check_authentication, :except => [:index, :show]
  
  @boxes = 
  {
    
    
  }
  
  
  protected
      
    def collection
      @collection ||= end_of_association_chain.paginate :page => params[:page], :per_page => 10
    end
  
end  