class LikesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    head 201
  end
end
