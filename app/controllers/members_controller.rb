class MembersController < ApplicationController
  #before_filter :get_project
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  def activate
    @project = Project.find(params[:id_project])
    @member = @project.members.find(params[:id])

    @member.activate!(current_user)
    redirect_to root_path

  end

  def index

    project = Project.find(params[:project_id])

    @members = project.members

    respond_to do |format|
      format.html
      format.xml { render :xml => @members }
    end
  end

  def show
    @project = Project.find(params[:project_id])
    @member = @project.members.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  # GET /members/new
  def new

    @project = Project.find(params[:project_id])
    @member = @project.members.build

    respond_to do |format|
      format.html
      format.xml { render :xml => @member }
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @member = @project.members.find(params[:id])
  end

  def create
    @project = Project.find(params[:project_id])
    @member = @project.members.create(params[:member])

    respond_to do |format|
      if @member.save
        UserMailer.confirm_email(@project, @member, @member.confirmation_token).deliver
        format.html { redirect_to(edit_project_path(@project), :notice => "New member was added to #{@project.name}") }
        format.xml { render :xml => @member, :status => :created, :location => [@member.project, @member] }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @member.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @project = Project.find(params[:project_id])
    @member = @project.members.find(params[:id])


    if @member.update_attributes(params[:member])
      redirect_to([@member.project, @member], :notice => 'Comment was successfully updated.')

    else
      render :action => "edit"

    end
  end


  def destroy

    @project = Project.find(params[:project_id])

    @member = @project.members.find(params[:id])
    @member.destroy

    redirect_to edit_project_path(@project)

  end

  private


  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:project_id, :member_name, :email_member, :project_owner, :confirmed)
  end

  def get_project
    @project = Project.find(params[:project_id])
  end


end
