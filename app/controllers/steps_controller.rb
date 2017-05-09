class StepsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @step = @task.steps.create(step_params)
    redirect_to task_path(@task)
  end

  def finish
    @step = Step.find(params[:step_id])
    @step.finish!
    redirect_to task_path(@step.task)
  end

  def unfinish
    @step = Step.find(params[:step_id])
    @step.unfinish!
    redirect_to task_path(@step.task)
  end

  private
    def step_params
      params.require(:step).permit(:title, :finished)
    end
end
