class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      flash[:notice] = "Review added successfully"
      redirect_to @restaurant
    else
      flash[:errors] = @review.errors.full_messages.join(', ')
      render :new
    end
  end

private

  def review_params
    params.require(:review).permit(:rating, :body)

  end
end 
