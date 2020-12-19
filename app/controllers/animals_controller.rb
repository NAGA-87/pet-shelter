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
end
