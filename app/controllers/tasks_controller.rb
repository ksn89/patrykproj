class TasksController < ApplicationController

  before_action :set_task, only: [:edit, :update, :destroy]


  def new
    @story = Story.find(params[:story_id])
    @task = @story.tasks.build
  end


  def edit
    @story = Story.find(params[:story_id])
    @task = @story.tasks.build
  end


  def create
    @story = Story.find(params[:story_id])
    @task = @story.tasks.build
    @task.user = current_user
    if @task.save
      @story.project.create_activity key: 'project.new_task', owner: current_user
      redirect_to edit_project_story_path(@story.project, @story), notice: 'Task was successfully created.'
    else
      render 'new'
    end

  end


  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @story = Story.find(params[:story_id])
    @task.destroy

    @story.project.create_activity key: 'project.destroy_task', owner: current_user
    redirect_to :back, notice: 'Task was successfully destroyed'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:task_field)
  end
end
