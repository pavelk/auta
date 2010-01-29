class Round < ActiveRecord::Base
  
  has_many :questions
  
  has_many :user_rounds
  has_many :users, :through => :user_rounds
  
end
