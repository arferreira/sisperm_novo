class Backup < ActiveRecord::Base
  belongs_to :server
  belongs_to :job

  
end
