class UsersController < ApplicationController
  before_action :all_tasks, only: [:show]

  def show
    @user = current_user
    @task = @user.tasks.new
  end

  private

  def all_tasks
    @tasks = current_user.tasks.all
  end

end
