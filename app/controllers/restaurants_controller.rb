class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]

  # GET /restaurants
  # GET /restaurants.json
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1
  # GET /restaurants/1.json
  def show
    @reviews = Review.where(restaurant: @restaurant)
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # POST /restaurants
  # POST /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to restaurant_path(@restaurant), notice: 'Restaurant added successfully.' }
      else
        format.html { render :new }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :city, :state, :zip, :description)
    end
end
