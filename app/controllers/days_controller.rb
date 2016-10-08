class DaysController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def index
    @days = Day.order("id desc")
  end

  def show
    @day = Day.find_by_id(params[:id])
    redirect_to '/' and return unless @day.present?
    @page_title = "#{@day.portuguese_title} Cartoon"
    @meta_description = "Cartoon for day #{@day.id} in Portugal for Neil and Santi of Super Serious Company"
    @share_image_url = @day.image_url.match(/\.com/) ? @day.image_url : "http://superseriouscompany.com#{ActionController::Base.helpers.asset_url("comic#{params[:id]}.jpg")}"
  end

  def current
    day = Day.order("id desc").first
    render json: {
      id: day.id,
      portuguese_title: day.portuguese_title,
      neil_quote: day.neil_quote,
      santi_quote: day.santi_quote,
      image_url: day.image_url,
      project_id: day.project_id,
      order: day.order
    }
  end

  def create
    day = Day.new(day_params)
    day.project = Project.first

    # TODO: this sux
    day.neil_quote = "<p>#{day.neil_quote}</p>"
    day.santi_quote = "<p>#{day.santi_quote}</p>"

    if day.save
      Subscription.notify_all
      render status: 201, json: { id: day.id }
    else
      render status: 400, json: { errors: day.errors.full_messages }
    end
  end

  private

  def day_params
    params.require(:day).permit(:portuguese_title, :image_url, :santi_quote, :neil_quote, :order)
  end
end
