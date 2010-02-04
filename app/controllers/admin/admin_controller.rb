class Admin::AdminController < ResourceController::Base
  
  layout 'admin'
  
  before_filter :set_values, :check_authorization
  #before_filter :check_authorization
    
  protected
      
    def collection
      @collection ||= end_of_association_chain.paginate :page => params[:page], :per_page => 20
    end
    
    def set_values
      @kraje = [["CZ011","Hlavní město Praha"],["CZ021","Středočeský kraj"],["CZ031","Jihočeský kraj"],["CZ032","Plzeňský kraj"],["CZ041","Karlovarský kraj"],["CZ042","Ústecký kraj"],["CZ051","Liberecký kraj"],["CZ052","Královéhradecký kraj"],["CZ053","Pardubický kraj"],["CZ061","Vysočina"],["CZ062","Jihomoravský kraj"],["CZ071","Olomoucký kraj"],["CZ072","Zlínský kraj"],["CZ081","Moravskoslezský kraj"]]
    end
    
  private
  
    def check_authorization
      #debugger
      unless current_user.urole == true
        #store_location
        flash[:error] = "Musíte se přihlásit pro přístup na tuto stránku."
        redirect_to new_user_session_url
        return false
      end  
    end  
      
  
end