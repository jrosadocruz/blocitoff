class TasksController < ApplicationController

  def show
    @task = current_user.tasks.find(params[:id])
  end

  def new
  end

  def create
    @user = current_user
    @task = @user.tasks.build(task_params)
    @new_task = @user.tasks.build(task_params)
    if @task.save
      flash[:notice] = "Task was created."
    else
      flash[:error] = "There was an error creating the task. Please try again."
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @user = current_user
    @task = @user.tasks.find(params[:id])
    if @task.destroy
      flash[:notice] = "Task was completed."
    else
      flash[:error] = "There was an error completing the task. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
   end

  end

  private

  def task_params
    params.require(:task).permit(:title)
  end

end
