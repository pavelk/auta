class HomeController < ApplicationController
  
  before_filter :check_authentication, :except => [:index, :markers, :markers_section, :markers_graduation]  
  def index
    
  end
  
  def markers
    if params[:type] == 'schools'
      render :text => (School.all(:select => "id, name, lat, lng", :conditions => "lat IS NOT NULL")).to_json
    elsif params[:type] == 'employers'
      render :text => (Employer.all(:select => "id, name, lat, lng", :conditions => "lat IS NOT NULL")).to_json #omezit attributes      
    end    
  end
  
  def markers_section
    render :text => Section.find(params[:section]).schools.to_json
  end
  
  def markers_graduation
    if(params[:section] == 'true')
      #na skolu
      render :text => Section.graduation(true).schools.to_json
    end
    if(params[:section] == 'false')
      #na skolu, pro collection nejde
      render :text => Section.graduation(false).schools.to_json
    end  
  end  
  
end
