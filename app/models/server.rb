class Server < ActiveRecord::Base
	belongs_to :service
	# validações
	validates :name, presence: true
	validates :ip, presence: true
	validates :day_week, presence: true
end
