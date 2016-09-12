class PagesController < ApplicationController
  def home
    @day = Day.last
  end

  def ideas
    @page_heading = "Ideas"
  end

  def philosophy
    @page_heading = "Nobody cares"
  end
end
