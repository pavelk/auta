class Photo < ActiveRecord::Base
  
  belongs_to :attachable, :polymorphic => true
  
  has_attached_file :photo, :styles => { :small => "136x103#", :small_show => "110x105#", :hint_small => "380x380>" },
                    :url  => "/assets/photos/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/photos/:id/:style/:basename.:extension"
  
end