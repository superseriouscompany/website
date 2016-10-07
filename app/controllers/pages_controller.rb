class PagesController < ApplicationController
  def home
    @day = Day.last
    @page_title = "Today's Cartoon"
    @meta_description = "What happened today to Neil and Santi at Super Serious Company Headquarters in Portugal"
  end

  def house
    @page_heading = "Our<br />House"
    @page_title = "Our House"
    @meta_description = "Super Serious HQ: where Neil and Santi live"
  end

  def ideas
    @page_heading = "Ideas"
    @page_title = "Idea Submission"
    @meta_description = "Submit ideas to Neil or Santi at Super Serious Company"
  end

  def philosophy
    @page_heading = "Nobody<br />Cares"
    @page_title = "Nobody Cares"
    @meta_description = "Things that Neil and Santi believe that are probably wrong"
  end
end
