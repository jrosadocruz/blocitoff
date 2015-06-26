class UsersController < ApplicationController

  def show
    @user = current_user
    @tasks = @user.tasks.all
    @task = @user.tasks.new
  end

end
