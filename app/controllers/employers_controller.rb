class EmployersController < FrontendController
  
  add_crumb ('Zaměstnavatelé') { |instance| instance.send :employers_path }
  before_filter :load_employer, :only => [:show]
  
  private
  
  def load_employer
    @employer = Employer.find(params[:id])
    add_crumb @employer.name
  end
  
end
