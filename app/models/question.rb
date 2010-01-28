class Question < ActiveRecord::Base
  
  belongs_to :round
  has_many :answers
  
end
