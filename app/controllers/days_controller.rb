class DaysController < ApplicationController
  skip_before_filter :verify_authenticity_token

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

    if day.save
      Subscription.notify_all
      render status: 201, json: { id: day.id }
    else
      render status: 400, json: { errors: day.errors.full_messages }
    end
  end

  def feed
    @days = Day.order("id desc")
    respond_to do |format|
      format.rss { render layout: false }
    end
  end

  private

  def day_params
    params.require(:day).permit(:portuguese_title, :image_url, :santi_quote, :neil_quote, :order)
  end
end
