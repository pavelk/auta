class Admin::OpenDoorsController < Admin::AdminController
  #debugger
  create.wants.html { redirect_to(edit_admin_school_path(School.first(params[:school_id])))}
  destroy.wants.html { redirect_to(edit_admin_school_path(School.first(params[:schoolid])))}
end  
