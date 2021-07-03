class TrainersController < ApplicationController

  def index
    @trainers = Trainer.all
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @user = current_user
    @trainer = Trainer.new(trainer_params)
    @trainer.user = @user

    if @trainer.save
      redirect_to trainers_path(@trainer)
    else
      render :new
    end

  end

  def show
    @trainer = Trainer.find(params[:id])
  end




  private

  def trainer_params
    params.require(:trainer).permit(:level, :discipline, :price, :about_me)
  end
end
