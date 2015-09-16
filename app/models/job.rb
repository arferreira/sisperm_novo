class Job < ActiveRecord::Base
  belongs_to :user
  has_many :backups
  accepts_nested_attributes_for :backups
end
