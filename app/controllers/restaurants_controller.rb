class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :mark_complete]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @reviews = Review.where(restaurant: @restaurant)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path, alert: 'Restaurant created successfully.'
    else
      redirect_to new_restaurant_path, alert: 'Error creating restaurant.'
    end
  end

  def mark_complete
    @restaurant.completed = params['completed']
    if @restaurant.save
      redirect_to restaurants_path, alert: 'Restaurant created successfully.'
    else
      redirect_to new_restaurant_path, alert: 'Error creating restaurant.'
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path, alert: 'Restaurant updated successfully.'
    else
      redirect_to new_restaurant_path, alert: 'Error updating restaurant.'
    end
  end

  def destroy
    @restaurant.delete
    redirect_to restaurants_path, alert: 'Restaurant updated successfully.'
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

end
