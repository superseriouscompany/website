class PagesController < ApplicationController
  def home
    @days = Day.all_cached
    @stats = Rails.cache.stats.first.last
  end
end
