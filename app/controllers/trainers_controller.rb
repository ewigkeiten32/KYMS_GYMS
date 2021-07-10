class TrainersController < ApplicationController

  def index
    @trainers = policy_scope(Trainer)
    # @trainers = Trainer.all
  end

  def new
    @trainer = Trainer.new
    authorize @trainer
  end

  def create
    @user = current_user
    @trainer = Trainer.new(trainer_params)
    @trainer.user = @user
    authorize @trainer
    if @trainer.save
      redirect_to trainers_path(@trainer)
    else
      render :new
    end

  end

  def show
    @trainer = Trainer.find(params[:id])
    authorize @trainer
  end

 def destroy
  @trainer = Trainer.find(params[:id])
  @trainer.destroy

  redirect_to user_path(current_user)
 end

  private

  def trainer_params
    params.require(:trainer).permit(:level, :discipline, :price, :about_me)
  end
end
