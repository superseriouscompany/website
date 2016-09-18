class DaysController < ApplicationController
  def show
    @day = Day.find_by_id(params[:id])
    redirect_to '/' unless @day.present?
  end
end
