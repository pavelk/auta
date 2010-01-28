class Note < ActiveRecord::Base
  
  default_scope :order => ["updated_at DESC"]
  
  has_many :photos, :as => :attachable, :dependent => :destroy
  
end
