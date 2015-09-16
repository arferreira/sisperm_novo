class ManageController < ApplicationController
   
  before_action :authenticate_user!
   	
  def admin

  	#permanencias
  	@stay = Stay.limit(6)
  	@user = User.limit(6)
  	@server = Server.limit(6)
  	
  end

  def stay
  	
  end

  def wrong
  	
  end

end
