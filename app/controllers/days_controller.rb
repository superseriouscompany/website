class DaysController < ApplicationController
  def show
    @day = Day.find_by_id(params[:id])
    @share_image_url = "http://superseriouscompany.com#{ActionController::Base.helpers.asset_url("comic#{params[:id]}.jpg")}"
    redirect_to '/' unless @day.present?
  end
end
