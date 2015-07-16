class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
      if @task.save
        flash[:notice] = "Yay! You saved a task all by yourself! Go get Beers!"
        redirect_to list_path(@task.list)
      else
        render :new
      end
    end

    def edit
      @list = List.find(params[:list_id])
      @task = Task.find(params[:id])
    end

    def update
      @list = List.find(params[:list_id])
      @task = Task.find(params[:id])
        if @task.update(task_params)
          flash[:notice] = "Yay--you changed this all by yourself like a big person! Go get Beers!"
          redirect_to list_path(@task.list)
        else
          render :edit
        end
      end

      def destroy
        @task Task.find(params[:id])
        @task.destroy
        flash[:notice] = "Task DESTROYED. Must.Get.BEERS!"
        redirect_to list_path(@task.list)
      end

      private
      def task_params
        params.require(:task).permit(:description)
      end
    end
