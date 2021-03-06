class TasksController < ApplicationController
  before_action :logged_in_user # ApplicationControllerに定義
  before_action :set_user
  before_action :set_task, only: %i(show edit update destroy)
  #before_action :logged_in_user
  before_action :correct_user
  
#     user_tasks GET    /users/:user_id/tasks(.:format)          tasks#index
#                POST   /users/:user_id/tasks(.:format)          tasks#create
#  new_user_task GET    /users/:user_id/tasks/new(.:format)      tasks#new
# edit_user_task GET    /users/:user_id/tasks/:id/edit(.:format) tasks#edit
#      user_task GET    /users/:user_id/tasks/:id(.:format)      tasks#show
#                PATCH  /users/:user_id/tasks/:id(.:format)      tasks#update
#                PUT    /users/:user_id/tasks/:id(.:format)      tasks#update
#                DELETE /users/:user_id/tasks/:id(.:format)      tasks#destroy
  
# ルーティングを見ると
# user_tasks GET    /users/:user_id/tasks(.:format)          tasks#index
           # POST   /users/:user_id/tasks(.:format)          tasks#create
           # よって、paramsはuser_idを探す
  def index
    #@user = User.find(params[:user_id])
    @tasks = @user.tasks
  end
  
  def show
    #@user = User.find(params[:user_id])
    #@task = @user.tasks.find_by(id: params[:id])
    
  end
  
  def new
    #@user = User.find(params[:user_id])
    @task = Task.new
   
  end
  
  def create
    #@user = User.find(params[:user_id])
    
    # buildは自動的にuser_idをセットしてインスタンスを生成することができる
    # user.rbに「has_many :tasks」があると、「Userインスタンス.tasks.build」というメソッドが使える」ようになる。
    # これは「Userインスタンスに紐付いたtaskインスタンスを生成する」メソッド。
    @task = @user.tasks.build(task_params)
    if @task.save
      flash[:success] = "タスクを新規作成しました。"
      redirect_to user_tasks_url @user
    else
      render :new
    end
  end

# ルーティング edit_user_task GET    /users/:user_id/tasks/:id/edit(.:format) tasks#edit  
  def edit
    #@user = User.find(params[:user_id])
    #@task = @user.tasks.find_by(id: params[:id])
  end
  
  def update
# ルーティング PATCH  /users/:user_id/tasks/:id(.:format)   tasks#update
# ルーティング user_task GET    /users/:user_id/tasks/:id(.:format)   tasks#show
    #@user = User.find(params[:user_id])
    #@task = @user.tasks.find_by(id: params[:id])
    if @task.update_attributes(task_params)
      flash[:success] = "タスクを更新しました。"
      redirect_to user_task_url(@user, @task)
    else
      render :edit
    end
  end
  
  def destroy
# DELETE /users/:user_id/tasks/:id(.:format)  tasks#destroy  
    #@user = User.find(params[:user_id])
    #@task = @user.tasks.find_by(id: params[:id])
    @task.destroy
    flash[:success] = "タスクを削除しました。"
      redirect_to user_tasks_url(@user)
  end
  
  # 基本的に外部からは隠蔽し、クラス内からのみ利用させたい場合は private 
  private
  
  def task_params
      params.require(:task).permit(:name, :description) 
  end
  
  # before_action
  def set_user
      @user = User.find(params[:user_id])
  end
  
  # before_action
  def set_task
      unless @task = @user.tasks.find_by(id: params[:id])
      flash[:danger] = "権限がありません。"
      redirect_to user_tasks_url @user
      end
  end
end
