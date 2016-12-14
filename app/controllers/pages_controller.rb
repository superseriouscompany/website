class PagesController < ApplicationController
  def home
    @day = Day.last
    @page_title = "Today's Cartoon"
    @meta_description = "What happened today to Neil and Santi at Super Serious Company Headquarters in Portugal"
  end

  def house
    @page_heading = "Our\nHouse"
    @page_title = "Our House"
    @meta_description = "Super Serious HQ: where Neil and Santi live"
  end

  def philosophy
    @page_heading = "Nobody\nCares"
    @page_title = "Nobody Cares"
    @meta_description = "Things that Neil and Santi believe that are probably wrong"
  end

  def story
    @page_title = "Story"
    @days = Day.order("id desc")
    @meta_description = "Super Serious Company history: Day One in Portugal On"
  end

  def show_day
    @day = Day.find_by_id(params[:id])
    redirect_to '/' and return unless @day.present?
    @page_title = "#{@day.portuguese_title} Cartoon"
    @meta_description = "Cartoon of day #{@day.id} in Portugal for Neil and Santi of Super Serious Company"
    @share_image_url = @day.image_url.match(/\.com/) ? @day.image_url : "https://superseriouscompany.com#{ActionController::Base.helpers.asset_url("comic#{params[:id]}.jpg")}"
  end

  def show_project
    @project          = Project.find_by_slug! params[:slug]
    @progress_updates = @project.progress_updates.order("id desc")
    @page_heading     = @project.name
    @page_title       = @project.name
    @meta_description = "#{@project.name}: a Super Serious Company effort"
  end

  def giggles_support
    @page_title = "Customer Support: Giggles App"
    @page_heading = "Giggles Support"
  end

  def privacy
    @page_title = "Privacy Policy"
  end

  def neil
    @page_title = "Neil Sarkar"
    @person = 'neil'
    @meta_description = "Neil Rajat Sarkar is the entire Super Serious Company engineering department."
    @share_image_url = "https://superseriouscompany.com#{ActionController::Base.helpers.asset_url("neil-sarkar/neil-ashley-jeremy-rooftop-arts-district.jpg")}"
    render :founder
  end

  def santi
    @page_title = "Santi Garza"
    @person = 'santi'
    @meta_description = "Santi owns the visual brand of Super Serious Company and draws all the cartoons. He's active as fuck and has a magnetic personality. His outgoing and earnest exterior belies an existential turmoil and an artistic struggle to represent the beauty he perceives around him."
    @share_image_url = "https://superseriouscompany.com#{ActionController::Base.helpers.asset_url("super-serious-santi-santiago-garza/santiago-garza-santi-tinder-desk-working-los-angeles-california.jpg")}"
    render :founder
  end

  def andrew
    @page_title = "Andrew Sauer"
    @person = 'andrew'
    @meta_description = "Andrew Sauer is three children in a trenchcoat pretending to be an adult man."
    @share_image_url = "https://superseriouscompany.com#{ActionController::Base.helpers.asset_url("andrew-sauer/andrew-sauer-animal-menagerie.jpg")}"
    render :founder
  end

  def projects
    @page_title = "Projects"
    @meta_description = "We're doing work, I swear"
    @active_projects = [Project.first, Project.last, Project.first, Project.last, Project.first]
    @finished_projects = Project.all
  end
end
