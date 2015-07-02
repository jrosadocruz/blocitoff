class TasksController < ApplicationController
  # http://www.gotealeaf.com/blog/the-detailed-guide-on-how-ajax-works-with-ruby-on-rails
  before_action :set_task, only:[:show, :destroy, :edit, :update, :archive]

  def show
  end

  def new
  end

  def create
    @user = current_user
    @task = @user.tasks.build
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
  end


  def update
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
  end

  def task_params
    params.require(:task).permit(:title, :due_date, :archived)
  end

end
