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
    @list = List.new(get_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private
  def get_params
    params.require(:list).permit(:name)
  end

end
