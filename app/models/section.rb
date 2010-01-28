class Section < ActiveRecord::Base
  
  has_and_belongs_to_many :schools
  
  default_scope :order => ["name ASC"]
  
  named_scope :graduation, lambda { |*args| {:conditions => ["graduation = ?", (args.first)]} } 
  named_scope :box_sections, :limit => 10, :order => 'RAND()'
  
end
