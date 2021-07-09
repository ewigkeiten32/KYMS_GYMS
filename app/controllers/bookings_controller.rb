class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @trainer = Trainer.find(params[:trainer_id])
    @booking = Booking.new
  end

  def create
    @trainer = Trainer.find(params[:trainer_id])
    @booking = Booking.new(bookings_params)
    @booking.trainer = @trainer
    @booking.user = current_user
    @booking.save
    redirect_to user_path(current_user)
  end

  def show
  end

  def edit
    @booking = Booking.find(params[:id])
    @trainer = Trainer.find(@booking.trainer_id)
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(bookings_params)

    redirect_to user_path(current_user)
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
