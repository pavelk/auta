class Admin::NotesController < Admin::AdminController
  update.wants.html { redirect_to collection_url }
  create.wants.html { redirect_to collection_url }
  
  def add_image
    #debugger
    @note = Note.find(params[:id])
    @photo = Photo.new(params[:photo])
    @note.photos << @photo
  
    respond_to do |format|
      format.html { redirect_to(edit_object_url(@note)) }
    end
  end
  
  def remove_image
    @note = Note.find(params[:id])
    @photo = Photo.find(params[:photo])
    @photo.destroy
    
    respond_to do |format|
      format.html { redirect_to(edit_object_url(@note)) }
    end
  end
   
end