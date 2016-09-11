class PagesController < ApplicationController
  def home
    @day = Day.last
  end
end
