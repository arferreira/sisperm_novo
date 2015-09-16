class Scale < ActiveRecord::Base
  belongs_to :stay

def self.by_month(month)
    where('extract(month from day_scale) = ?', month)
end



end
