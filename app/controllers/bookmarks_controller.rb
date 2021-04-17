class BookmarksController < ApplicationController
  
  def new
    @list = List.find(params[:list_id])
    # raise
    @bookmark = Bookmark.new
  end
  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(get_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end
  
  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private
  def get_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
