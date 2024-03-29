class TasksController < ApplicationController
  def index
    tasks = Task.all
    render json: tasks
  end

  def create
    Task.create(task_params)
    head  :created
  end

  def destroy
    Task.find(params[:id]).destroy
    head :ok
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    head :ok
  end

  private

  def task_params
    params.permit(:name, :is_done)
  end

end
