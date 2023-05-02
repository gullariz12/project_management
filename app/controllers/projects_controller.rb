class ProjectsController < ApplicationController
  before_action :get_project, only: [:edit, :update, :show, :destroy]

  def index
    @projects = current_user.projects
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      flash[:success] = "Project successfully created"
      redirect_to projects_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @project.update(project_params)
      redirect_to projects_path, notice: 'Project has been updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    if @project.destroy
      flash[:notice] = 'Project has been deleted successfully.'
    else
      flash[:alert] = 'Could not be deleted.'
    end

    redirect_to projects_path
  end

  private
  
  def project_params
    params.require(:project).permit(:title)
  end

  def get_project
    @project = current_user.projects.find(params[:id])
  end
end