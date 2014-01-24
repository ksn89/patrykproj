class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_filter :find_story , :only => [:new, :create, :destroy]
  def new
    @comment = @story.comments.build
  end


  def create
    @comment = @story.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      @story.project.create_activity key: 'project.new_comment', owner: current_user
      redirect_to edit_project_story_path(@story.project, @story), notice: 'Comments was successfully created'
    else
      render 'new'
    end

  end


  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @comment.destroy
    @story.project.create_activity key: 'project.destroy_comment', owner: current_user
    redirect_to (:back)

  end

  private
  def find_story
    @story = Story.find(params[:story_id])
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:body)
  end
end
