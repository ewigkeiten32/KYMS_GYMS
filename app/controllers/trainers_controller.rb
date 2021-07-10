class TrainersController < ApplicationController
  def index
    if params[:query].present?
      @trainers = Trainer.search_by_discipline_and_level(params[:query])
    else
      @trainers = Trainer.all
    end
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




  private

  def trainer_params
    params.require(:trainer).permit(:level, :discipline, :price, :about_me)
  end
end
