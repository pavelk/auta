class Employer < ActiveRecord::Base
  
  has_many :photos, :as => :attachable, :dependent => :destroy
  
end
