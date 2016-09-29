class ProjectsController < ApplicationController
  def show
    @project = Project.find_by_slug! params[:slug]
    @days = @project.days.order("id asc")
    @page_heading = @project.name
  end
end
