class AnimalsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :destroy]
  before_action :set_animal, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    # @animals = Animal.all.order('created_at DESC')
    @animals = Animal.order(created_at: :desc).page(params[:page]).per(4)
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @animal.comments.includes(:user)
  end

  def edit
  
  end

  def update
    if @animal.update(animal_params)
      redirect_to animal_path
    else
      render :edit
    end
  end

  def destroy
    @animal.destroy
    redirect_to root_path
  end

  private

  def animal_params
    params.require(:animal).permit(:animal_name, :current_location, :animal_age, :type, :male_female_id, :vaccine_id, :background, :personality, :health, :transfer_method, :image).merge(user_id: current_user.id)
  end

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def move_to_index
    redirect_to root_path unless current_user == @animal.user
  end
end
