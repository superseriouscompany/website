class ThoughtsController < ApplicationController
  def create
    thought = Thought.new({
      body: params[:body],
      thinker: params[:thinker]
    })

    if thought.save
      flash[:success] = "Thanks!"
    else
      flash[:error] = "Sorry, something went wrong."
    end

    redirect_to :back
  end
end
