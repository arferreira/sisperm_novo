class ManageController < ApplicationController
   
  before_action :authenticate_user!
   	
  def admin
    if current_user.login == 'barellywgp' || current_user.login == 'bazzananas' || current_user.login == 'kaiquejcs' || current_user.login == 'mirallesvfo' || current_user.login == 'cordobalm'
      redirect_to :controller => 'manage', :action => 'stay'
    elsif current_user.login == 'ricardosouzaf' || current_user.login == 'vanonidv' || current_user.login == 'zagor' || current_user.login == 'martinsjb' || current_user.login == 'massariolmc' || current_user.login == 'patrickls' || current_user.login == 'anacarolinams'   	
    #permanencia
  	@stay = Stay.limit(6)
  	@user = User.limit(6)
  	@server = Server.limit(6)
    else
      redirect_to :controller => 'manage', :action => 'wrong'
  	end
  end

  def stay
  	
  end

  def wrong
  	
  end

end
