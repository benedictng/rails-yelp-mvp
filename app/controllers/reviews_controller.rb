class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :destroy]

  def index
    set_restaurant
    @reviews = @restaurant.reviews
  end

  def destroy
    @review.delete
    redirect_to restaurant_path(@review.restaurant), alert: 'Review updated successfully.'
  end

  def show

  end

  def create
    set_restaurant
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant), alert: 'review created successfully.'
    else
      redirect_to new_restaurant_review_path(@restaurant), alert: 'Error creating review.'
      # render new_restaurant_review_path(@restaurant)
    end
  end

  def new
    set_restaurant
    @review = Review.new
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :content, :restaurant)
  end
end
