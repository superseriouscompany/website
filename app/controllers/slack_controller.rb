class SlackController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def post
    puts params.inspect
    render json: {
      text: "Hello World"
    }
  end
end
