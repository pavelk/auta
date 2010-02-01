class Hint < ActiveRecord::Base
  
  default_scope :order => ["updated_at DESC"]
  
  named_scope :box_hint, :limit => 1, :order => 'RAND()'
  
  has_many :photos, :as => :attachable, :dependent => :destroy
  
  define_index do
    indexes :name
    indexes perex
    indexes content
  end
  
end
