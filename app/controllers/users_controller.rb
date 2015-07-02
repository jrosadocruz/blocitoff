class UsersController < ApplicationController
  before_action :all_tasks, only: [:show]
  before_action :archived_tasks, only: [:archived]
  respond_to :html, :js

  def show
    @user = current_user
    @new_task = Task.new
  end

  def archived
    @user = current_user
  end

  private

  def all_tasks
    @tasks = current_user.tasks.where(archived: false)
  end
  def archived_tasks
    @archived_tasks = current_user.tasks.where(archived: true)
  end

end
