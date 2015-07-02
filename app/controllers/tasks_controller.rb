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

  def edit
    @user = current_user
    @task = Task.find(params[:id])
  end

  def update
    @user = current_user
    @task = Task.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:notice] = "Task was updated."
    else
      flash[:error] = "There was an error updating this task. Please try again later."
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
    params.require(:task).permit(:titl, :due_date, :archived)
  end

end
