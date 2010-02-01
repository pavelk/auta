class LookController < ApplicationController
  
  add_crumb ('Výsledky')
  
  before_filter :check_authentication, :except => [:index]
  
  def index
    if(params[:type_search] == "all")
      @results = ThinkingSphinx::Search.search params[:search]
    elsif(params[:type_search] == "schools") 
      @results = School.search params[:search]
    elsif(params[:type_search] == "sections")     
      @results = Section.search params[:search]
    end  
  end

end
