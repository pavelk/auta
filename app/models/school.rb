class School < ActiveRecord::Base
  
  has_many :open_doors, :dependent => :destroy
  has_and_belongs_to_many :sections
  
  has_many :photos, :as => :attachable, :dependent => :destroy
  
  def to_param
    "#{id}-#{name.parameterize}"
  end
  
  
end
