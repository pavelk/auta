class Admin::RoundsController < Admin::AdminController
  
  def index
      @rounds = UserRound.all(:conditions => 'answer_ok = 1')
  end
  
end