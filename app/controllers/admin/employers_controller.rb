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
  
  def add_user
    #debugger
    @emp = Employer.find(params[:id])
    psswd = Array.new(8/2) { rand(256) }.pack('C*').unpack('H*').first
    user = User.new 
    user.user_name = @emp.name 
    user.email = @emp.email1
    user.birth = '-----'
    user.password = psswd
    user.password_confirmation = psswd
    user.urole = 3
    user.active = 1
    user.save
    if user.save
      @emp.user_id = user.id 
      @emp.save
      Notifier.deliver_new_user(@emp.name, psswd)
      Notifier.deliver_registration_confirmation_employer(@emp.email1, psswd)
    end
  
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
  
  def map
    @employer = Employer.find(params[:id])
  end
  
  def add_marker
    #debugger
    @employer = Employer.find(params[:id])
    respond_to do |format|
      if @employer.update_attributes(params[:employer])
        format.html { redirect_to collection_url }
      end
    end
  end

end
