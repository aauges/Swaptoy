class ToysController < ApplicationController
  include Pagy::Backend

  def index
    @pagy, @toys = pagy(Toy.all)

    if params[:baby_scope].present?
      @toys = @toys.baby
    elsif params[:toddler_scope].present?
      @toys = @toys.toddler
    elsif params[:preschool_scope].present?
      @toys = @toys.preschool
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'searchresult.html', locals: { toys: @toys } }
    end
  end

  def show
    @toy = Toy.find(params[:id])
    @booking = Booking.new
    @review = Review.new
    @toys = Toy.where.not(id: @toy.id)
    @toys = @toys.where(age: @toy.age..(@toy.age + 10)).limit(3)
    @previous_booking = current_user.bookings.find_by(toy: @toy)
  end

  def new
    @toy = Toy.new
    authorize @toy
  end

  def create
    @toy = Toy.new(toy_params)
    @toy.user = current_user
    authorize @toy
    if @toy.save!
      redirect_to toy_path(@toy)
    else
      render :new
    end
  end

  def edit
    @toy = Toy.find(params[:id])
    authorize @toy
  end

  def update
    @toy = Toy.find(params[:id])
    @toy.update(toy_params)
    authorize @toy

    redirect_to toy_path
  end

  private

  def toy_params
    params.require(:toy).permit(:name, :description, :image)
  end
end
