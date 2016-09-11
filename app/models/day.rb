class Day < ActiveRecord::Base
  belongs_to :project

  def self.all_cached
     Rails.cache.fetch('Day.all') { all }
  end
end
