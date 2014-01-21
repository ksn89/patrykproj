class StoriesController < ApplicationController
  before_action :set_story, only: [:show, :edit, :update, :destroy]
  before_filter :find_story, :only => [:done, :current, :icebox, :backlog, :index]


  def done

  end

  def current

  end

  def backlog


  end

  def icebox

  end

  def index

  end

  def show
    @project = Project.find(params[:project_id])
    @story = @project.stories.find(params[:id])
  end

  def new
    @project = Project.find(params[:project_id])
    @story = @project.stories.build
  end

  def edit
    @project = Project.find(params[:project_id])
    @story = @project.stories.find(params[:id])
  end


  def create
    @project = Project.find(params[:project_id])
    @story = @project.stories.create(params[:story])
    if @story.save
      @project.create_activity key: 'project.new_story', owner: current_user
      redirect_to project_path(@project)
    else
      render "new"
    end


  end

  def update
    @project = Project.find(params[:project_id])
    @story = @project.stories.find(params[:id])


    if @story.update_attributes(params[:story])
      redirect_to(:back, :notice => 'Stories was successfully updated.')

    else
      render :action => "edit"

    end
  end


  def destroy
    @project = Project.find(params[:project_id])

    @story = @project.stories.find(params[:id])
    @story.destroy

    redirect_to(:back)
  end

  private
  def find_story
    @project = Project.find(params[:id_project])
    @stories = @project.stories
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_story
    @story = Story.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def story_params
    params.require(:story).permit(:name, :project_id, :status, :description, :story_type, :owner)
  end

  def get_project
    @project = Project.find(params[:project_id])
  end
end
