class ReportController < ApplicationController
  
  def scale
  	@scales = Scale.by_month(Time.now.month)
  	p @scales
  end

end
