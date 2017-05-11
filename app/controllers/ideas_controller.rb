class IdeasController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
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
