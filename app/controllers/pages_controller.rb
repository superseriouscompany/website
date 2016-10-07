class PagesController < ApplicationController
  def home
    @day = Day.last
    @page_title = "Today's Cartoon"
  end

  def ideas
    @page_heading = "Ideas"
    @page_title = "Idea Submission Forum"
  end

  def philosophy
    @page_heading = "Nobody<br />Cares"
    @page_title = "Nobody Cares"
  end

  def house
    @page_heading = "Our<br />House"
    @page_title = "Our House"
  end
end
