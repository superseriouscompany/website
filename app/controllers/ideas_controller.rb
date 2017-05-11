class IdeasController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
    @meta_description = "The last hurrah."
    @share_image_url = "https://tribkcpq.files.wordpress.com/2015/02/s042881738-300.jpg"
  end

  def create
    @meta_description = "The last hurrah."
    @share_image_url = "https://tribkcpq.files.wordpress.com/2015/02/s042881738-300.jpg"
    @idea = Idea.new(idea_params)
    if @idea.save
      @cool = true
      render :new
    else
      render text: "Nope, didn't save. #{@idea.errors.full_messages.to_sentence}"
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:idea)
  end

end
