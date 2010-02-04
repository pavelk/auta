class Admin::BlogsController < Admin::AdminController
  update.wants.html { redirect_to collection_url }
  create.wants.html { redirect_to collection_url }
  
  def add_image
    #debugger
    @blog = Blog.find(params[:id])
    @photo = Photo.new(params[:photo])
    @blog.photos << @photo
  
    respond_to do |format|
      format.html { redirect_to(edit_object_url(@blog)) }
    end
  end
  
  def remove_image
    @blog = Blog.find(params[:id])
    @photo = Photo.find(params[:photo])
    @photo.destroy
    
    respond_to do |format|
      format.html { redirect_to(edit_object_url(@blog)) }
    end
  end 
end