class Admin::HintsController < Admin::AdminController
  update.wants.html { redirect_to collection_url }
  create.wants.html { redirect_to collection_url }
  
  def add_image
    #debugger
    @hint = Hint.find(params[:id])
    @photo = Photo.new(params[:photo])
    @hint.photos << @photo
  
    respond_to do |format|
      format.html { redirect_to(edit_object_url(@hint)) }
    end
  end
  
  def remove_image
    @hint = Hint.find(params[:id])
    @photo = Photo.find(params[:photo])
    @photo.destroy
    
    respond_to do |format|
      format.html { redirect_to(edit_object_url(@hint)) }
    end
  end 
end