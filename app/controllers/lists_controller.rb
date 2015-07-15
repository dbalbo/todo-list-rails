class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to lists_path
    else
      render :new
    end

    def edit
      @list = List.find(params[:id])
    end

    def update
      @list = List.find(params[:id])
      if @list.update(list_params)
        flash[:notice] ="Boom! you updated this correctly! Go Have Beers!"
        redirect_to lists_path
      else
        render :edit
      end
    end

    def destroy
      @list = List.find(params[:id])
      @list.destroy
      flash[:notice] = "List was DESTROYED"
      redirect_to lists_path
    end
  end

  private
  def list_params
    params.require(:list).permit(:name, :description)
  end
end
