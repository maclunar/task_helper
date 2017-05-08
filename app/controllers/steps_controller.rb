class StepsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @step = @task.steps.create(step_params)
    redirect_to task_path(@task)
  end

  private
    def step_params
      params.require(:step).permit(:title, :finished)
    end
end
