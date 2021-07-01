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



  private

  def trainer_params
    params.require(:trainer).permit(:level, :discipline, :price)
  end
end
