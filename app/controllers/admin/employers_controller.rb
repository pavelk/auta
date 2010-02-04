class Admin::EmployersController < Admin::AdminController

  update.wants.html { redirect_to collection_url }
  create.wants.html { redirect_to collection_url }
  
  def add_image
    #debugger
    @emp = Employer.find(params[:id])
    @photo = Photo.new(params[:photo])
    @emp.photos << @photo
  
    respond_to do |format|
      format.html { redirect_to(edit_object_url(@emp)) }
    end
  end
  
  def remove_image
    @emp = Employer.find(params[:id])
    @photo = Photo.find(params[:photo])
    @photo.destroy
    
    respond_to do |format|
      format.html { redirect_to(edit_object_url(@emp)) }
    end
  end

end
