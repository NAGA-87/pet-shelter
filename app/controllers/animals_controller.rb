class AnimalsController < ApplicationController
  def index
    @animals = Animal.all.order('created_at DESC')
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

  private

  def animal_params
    params.require(:animal).permit(:animal_name, :current_location, :animal_age, :type, :male_female_id, :vaccine_id, :background, :personality, :health, :transfer_method, :image).merge(user_id: current_user.id)
  end
end
