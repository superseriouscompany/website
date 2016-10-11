class ProjectsController < ApplicationController
  def show
    @project          = Project.find_by_slug! params[:slug]
    @progress_updates = @project.progress_updates.order("id desc")
    @page_heading     = @project.name
    @page_title       = @project.name
    @meta_description = "#{@project.name}: a Super Serious Company effort"
  end
end
