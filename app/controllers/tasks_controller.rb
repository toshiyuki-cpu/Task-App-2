class TasksController < ApplicationController
  
# ルーティングを見ると
# user_tasks GET    /users/:user_id/tasks(.:format)          tasks#index
           # POST   /users/:user_id/tasks(.:format)          tasks#create
           # よって、paramsはuser_idを探す
  def index
    @user = User.find(params[:user_id])
    @tasks = @user.tasks
  end
  
  def show
    @user = User.find(params[:user_id])
  end
  
  def new
    @user = User.find(params[:user_id])
    @task = Task.new
   
  end
  
  def create
    @user = User.find(params[:user_id])
    
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
  
  def task_params
      params.require(:task).permit(:name, :description) 
      
  end
end
