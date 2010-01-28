class SectionsController < FrontendController

  add_crumb ('Obory') { |instance| instance.send :sections_path }
  
  before_filter :load_section, :only => [:show]

  def graduations
    @sections = Section.graduation(true).paginate(:all, 
                                 :per_page => 10,
                                 :page => params[:page],
                                 :order => 'name ASC')
    add_crumb 'Obory s maturitou', graduations_sections_path                              
    render :action => "index"                                                          
  end

  def no_graduations
    @sections = Section.graduation(false).paginate(:all, 
                                 :per_page => 10,
                                 :page => params[:page],
                                 :order => 'name ASC')
    add_crumb 'Obory bez maturity', no_graduations_sections_path                              
    render :action => "index"
  end
  
  private
  
    def load_section
      @section = Section.find(params[:id])
      add_crumb @section.name
    end

end