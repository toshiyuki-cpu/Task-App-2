class TasksController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end
  
  def show
    @user = User.find(params[:user_id])
  end
  
  def new
    @user = User.find(params[:user_id])
    @task = Task.new
  end
  
end
