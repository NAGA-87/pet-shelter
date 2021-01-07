class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_animal, only: [:index, :create]
  before_action :move_to_index_after_sold_out, only: [:index, :create]

  def index
    @order = FormOrder.new
  end

  def create
    @order = FormOrder.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:form_order).permit(:postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number,  ).merge(user_id: current_user.id, animal_id: params[:animal_id] )
  end

  def set_user_animal
    @animal = Animal.find(params[:animal_id])
  end

  def move_to_index_after_sold_out
    redirect_to root_path unless @animal.order == nil && current_user != @animal.user
  end

end
