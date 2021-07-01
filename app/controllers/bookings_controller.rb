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
    @booking.save
    redirect_to user_session_path
  end

  def show
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
