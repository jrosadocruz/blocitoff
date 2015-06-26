class TasksController < ApplicationController

  def show
    @task = current_user.tasks.find(params[:id])
  end

  def new
  end

  def create
    @user = current_user
    @task = @user.tasks.build(task_params)
    if @task.save
      flash[:notice] = "Task was created."
      redirect_to authenticated_root_path
    else
      flash[:error] = "There was an error creating the task. Please try again."
      redirect_to authenticated_root_path
    end
  end

  private

  def task_params
    params.require(:task).permit(:title)
  end

end
