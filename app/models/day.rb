class Day < ActiveRecord::Base

  def self.all_cached
     Rails.cache.fetch('Day.all') { all }
  end
end
