# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :fetch_project, only: %i[edit update show]

  def index
    @projects = current_user.projects
  end

  def show; end

  def new
    @project = current_user.projects.new
    @project.tasks.build
  end

  def edit; end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      flash[:notice] = t('controllers.create_success', object_name: 'Project')
      redirect_to projects_path
    else
      flash[:alert] = @project.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @project.update(project_params)
      render :update
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:title,
                                    tasks_attributes: %i[id title user_id description priority])
  end

  def fetch_project
    @project = current_user.projects.find(params[:id])
  end
end
