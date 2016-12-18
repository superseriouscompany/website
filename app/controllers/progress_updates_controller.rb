class ProgressUpdatesController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    if params[:project_slug].present?
      progress_update = Project.find_by_slug!(params[:project_slug]).progress_updates.new(progress_update_params)
    else
      progress_update = Project.order("id desc").first.progress_updates.new(progress_update_params)
    end


    if progress_update.save
      render status: 201, json: { id: progress_update.id }
    else
      render status: 400, json: { errors: progress_update.errors.full_messages }
    end
  end

  def update
    progress_update = ProgressUpdate.find(params[:id])

    progress_update.thumbnail_url = params[:progress_update][:thumbnail_url]

    if progress_update.save
      render status: 204
    else
      render status: 400, json: { errors: progress_update.errors.full_messages }
    end
  end

  private

  def progress_update_params
    params.require(:progress_update).permit(:description, :image_url, :thumbnail_url)
  end
end
