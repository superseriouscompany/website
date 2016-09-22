class DaysController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def show
    @day = Day.find_by_id(params[:id])
    redirect_to '/' unless @day.present?
    @share_image_url = @day.image_url.match(/\.com/) ? @day.image_url : "http://superseriouscompany.com#{ActionController::Base.helpers.asset_url("comic#{params[:id]}.jpg")}"
  end

  def create
    day = Day.new(day_params)
    day.project = Project.first

    # TODO: this sux
    day.neil_quote = "<p>#{day.neil_quote}</p>"
    day.santi_quote = "<p>#{day.santi_quote}</p>"

    if day.save
      head 204
    else
      render status: 400, json: { errors: day.errors.full_messages }
    end
  end

  private

  def day_params
    params.require(:day).permit(:portuguese_title, :image_url, :santi_quote, :neil_quote, :order)
  end
end
