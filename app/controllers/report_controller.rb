class ReportController < ApplicationController
  before_action :authenticate_user!
  def scale
  	@scales = Scale.by_month(Time.now.month)
  	p @scales
  end
  def service
  	@jobs = Job.all
  end

end
