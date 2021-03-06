class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    if @review.save
      redirect_to toy_path(@booking.toy)
    else
      render "toys/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
