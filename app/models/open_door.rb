class OpenDoor < ActiveRecord::Base
  
  belongs_to :school
  
  default_scope :conditions => ["date_from >= ?", Date.today.beginning_of_day], :order => 'date_from'
  
  named_scope :box_days, lambda { {:conditions =>["date_from >= ?", Date.today.beginning_of_day], :order => 'date_from', :limit => 5 }}
  
  define_index do
    indexes description
  end
  
end
