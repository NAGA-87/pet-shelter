class FormOrder
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture_id, :municipality, :house_number, :building_name, :phone_number, :user_id, :animal_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'status Select' }
    validates :municipality
    validates :house_number
    validates :phone_number, numericality: { only_integer: true, message: 'Input only number' }
    validates :user_id
    validates :animal_id
  end

  def save
    order = Order.create(user_id: user_id, animal_id: animal_id)
    ParentsInfo.create( postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id )
  end
  
end
