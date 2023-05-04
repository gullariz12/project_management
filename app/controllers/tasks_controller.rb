# frozen_string_literal: true

class TasksController < ApplicationController
  before_action :fetch_task, only: %i[edit update show destroy assign]

  def show; end

  def new
    @task = project.tasks.new
  end

  def edit; end

  def create
    @task = project.tasks.new(task_params)

    if @task.save
      flash[:notice] = t('controllers.create_success', object_name: 'Task')
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = @task.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @task.update(task_params)
      render :update
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @task.destroy
      flash[:notice] = t('controllers.delete_success', object_name: 'Task')
    else
      flash[:alert] = @task.errors.full_messages.to_sentence
    end

    redirect_back(fallback_location: root_path)
  end

  def assign
    assigned_task = AssignedTask.where(task: @task).first_or_create

    assigned_task.update(user_id: params[:user_id])
  end

  private

  def task_params
    params.require(:task).permit(:title, :user_id, :description, :priority)
  end

  def fetch_task
    @task = project.tasks.find(params[:id])
  end

  def project
    @project ||= Project.find(params[:project_id])
  end
end
