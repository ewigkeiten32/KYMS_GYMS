class BookingsController < ApplicationController
  before_action :set_articles, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @trainer = Trainer.find(params[:trainer_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @trainer = Trainer.find(params[:trainer_id])
    @booking = Booking.new(bookings_params)
    @booking.trainer = @trainer
    @booking.user = current_user
    @booking.save
    authorize @booking
    redirect_to user_path(current_user)
  end

  def show
  end

  def edit
    @trainer = Trainer.find(@booking.trainer_id)
    authorize @booking
  end

  def update
    @booking.update(bookings_params)
    authorize @booking

    redirect_to user_path(current_user)
  end

  def destroy
    @booking.destroy
    authorize @booking

    redirect_to user_path(current_user)
 end


  private

  def bookings_params
    params.require(:booking).permit(:start_time, :end_time)
  end

  def set_articles
    @booking = Booking.find(params[:id])
  end
end
