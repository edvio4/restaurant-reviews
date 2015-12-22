class ReviewsController < ApplicationController

  # GET /reviews/new
  def new
    @restaurant = Restaurant.find(params[:restaurant_id]) unless params[:restaurant_id].nil?
    @review = Review.new
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.new(review_params)
    respond_to do |format|
      if @review.save
        format.html { redirect_to restaurant_path(@restaurant), notice: 'Review added successfully.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:rating, :body)
    end
end
