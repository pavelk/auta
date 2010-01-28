class HintsController < FrontendController
  
  add_crumb ('Rady odborníků') { |instance| instance.send :hints_path }
  before_filter :load_hint, :only => [:show]
  before_filter :check_authentication, :except => [:index, :show, :specialists,:no_specialists]
  
  def specialists
    @hints = Hint.all(:conditions => 'visible = true AND hint_type = true').paginate( :per_page => 10, :page => params[:page] )
    add_crumb 'Rady autoprofesionalů', specialists_hints_path                              
    render :action => "index"                                                          
  end
  
  def no_specialists
    @hints = Hint.all(:conditions => 'visible = true AND hint_type = false').paginate( :per_page => 10, :page => params[:page] )
    add_crumb 'Rady odborníků', no_specialists_hints_path                              
    render :action => "index"
  end
  
  private
  
    def load_hint
      @hint = Hint.find(params[:id])
      add_crumb @hint.name
    end    
end
