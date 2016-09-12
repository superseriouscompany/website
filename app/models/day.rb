class Day < ActiveRecord::Base
  belongs_to :project

  after_save :clear_cache
  after_destroy :clear_cache

  def self.all_cached
     Rails.cache.fetch('Day.all') { all }
  end

  def clear_cache
    Rails.cache.delete('Day.all')
  end
end
