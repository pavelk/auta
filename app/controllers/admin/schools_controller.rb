class Admin::SchoolsController < Admin::AdminController
  
  update.wants.html { redirect_to collection_url }
  create.wants.html { redirect_to collection_url }
  
  def add_image
    #debugger
    @school = School.find(params[:id])
    @photo = Photo.new(params[:photo])
    @school.photos << @photo
  
    respond_to do |format|
      format.html { redirect_to(edit_object_url(@school)) }
    end
  end
  
  def remove_image
    @school = School.find(params[:id])
    @photo = Photo.find(params[:photo])
    @photo.destroy
    
    respond_to do |format|
      format.html { redirect_to(edit_object_url(@school)) }
    end
  end
  
  def map
    @school = School.find(params[:id])
  end
  
  def add_marker
    #debugger
    @school = School.find(params[:id])
    respond_to do |format|
      if @school.update_attributes(params[:school])
        format.html { redirect_to collection_url }
      end
    end
  end  
  
end
