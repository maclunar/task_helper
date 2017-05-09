class TasksController < ApplicationController

  def show
    @task = Task.find(params[:id])
  end

  def index
    @tasks = Task.all.order(:number)
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to @task
    else
      render 'new'
    end
  end

  private
    def task_params
      params.require(:task).permit(:number, :title, :description)
    end
end