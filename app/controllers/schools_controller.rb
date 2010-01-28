class SchoolsController < FrontendController
  
  add_crumb ('Školy') { |instance| instance.send :schools_path }
  
  before_filter :load_school, :only => [:show]
  
  private
  
  def load_school
    @school = School.find(params[:id])
    add_crumb @school.name
  end
  
end
