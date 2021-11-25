class BookingsController < ApplicationController
  def new
    @toy = Toy.find(params[:toy_id])
    @booking = Booking.new
  end

  def create
    @toy = Toy.find(params[:toy_id])
    @booking = Booking.new
    @monthly_subscription = current_user.monthly_subscriptions.last
    @booking.monthly_subscription = @monthly_subscription
    @booking.toy = @toy
    if @booking.save
      redirect_to toy_path(@toy)
    else
      render :new
    end
  end

  def destroy
    @toy = Toy.find(params[:toy_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
