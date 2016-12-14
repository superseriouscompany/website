class Project < ActiveRecord::Base
  has_many :days
  has_many :progress_updates

  def self.current
    where("completed_at is null").order("created_at desc")
  end

  def self.completed
    where("completed_at is not null").order("completed_at desc")
  end
end
