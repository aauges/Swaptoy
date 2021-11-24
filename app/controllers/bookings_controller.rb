class BookingsController < ApplicationController
  def show
    @booking = Boooking.find(params[:id])
    @toy = Booking.toy
    authorize @booking
  end

  def new
    @toy = @Toy.find(params[:toy_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @toy = Toy.find(params[:toy_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.toy = @toy
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @toy = Toy.find(params[:toy_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    authorize @booking
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
