class Project < ActiveRecord::Base
  has_many :days
  has_many :progress_updates
end
