class TasksController < ApplicationController
  # http://www.gotealeaf.com/blog/the-detailed-guide-on-how-ajax-works-with-ruby-on-rails
  before_action :set_task, only:[:show, :destroy, :edit, :update, :archive, :unarchive]

  def show
  end

  def new
  end

  def create
    @user = current_user
    @task = @user.tasks.build(task_params)
    @tasks = @user.tasks.where(archived: false)
    @new_task = @user.tasks.build
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
    @task = @user.tasks.find(params[:id])
  end


  def update
    @task = @user.tasks.find(params[:id])
    if @task.update_attributes(task_params)
      flash[:notice] = "Task was updated."
      redirect_to root_path
    else
      flash[:error] = "There was an error updating this task. Please try again later."
      render :edit
    end
  end

  def archive
    if @task.archive!
      flash[:notice] = "Task was archived."
    else
      flash[:error] = "There was an error archiving the task. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def unarchive
    if @task.unarchive!
      flash[:notice] = "Task was unarchived."
    else
      flash[:error] = "There was an error unarchiving the task. Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
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

  def set_task
    @user = current_user
    @task = @user.tasks.find(params[:id])
    @tasks = @user.tasks.where(archived: false)
  end

  def task_params
    params.require(:task).permit(:title, :due_date, :archived)
  end

end
