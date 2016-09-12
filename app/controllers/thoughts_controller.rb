class ThoughtsController < ApplicationController
  def create
    thought = Thought.new({
      body: params[:body]
    })

    if thought.save
      flash[:success] = "Thanks!"
    else
      flash[:error] = "Sorry, something went wrong."
    end

    redirect_to :back
  end
end
