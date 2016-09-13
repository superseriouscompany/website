class ProjectsController < ApplicationController
  def show
    @project = Project.find_by_slug! params[:slug]
    @page_heading = @project.name
  end
end
