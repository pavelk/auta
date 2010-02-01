class Employer < ActiveRecord::Base
  
  has_many :photos, :as => :attachable, :dependent => :destroy
  
  define_index do
    indexes :name
    indexes anotation
    indexes street1
    indexes street2
    indexes town
    indexes zip_code
    indexes email1
    indexes email2
    indexes www1
    indexes www2
    indexes phone1
    indexes phone2
    indexes fax1
    indexes fax2
    indexes ico
    indexes dic
  end
  
end
