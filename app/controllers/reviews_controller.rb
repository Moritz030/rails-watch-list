class ReviewsController < ApplicationController

  def new
    @list = List.find(params[:list_id])
    @review = Review.new
  end
  def create
    @review = Review.new(get_params)
    @list = List.find(params[:list_id])
    @review.list = @list
    if @review.save
      redirect_to list_path(@list)
    else
      render :new
    end
end

  private
  def get_params
    params.require(:review).permit(:content)
  end
end
