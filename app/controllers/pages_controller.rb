class PagesController < ApplicationController
  def home
    @days = Day.all_cached
  end
end
