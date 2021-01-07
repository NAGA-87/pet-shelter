class ParentsInfo < ApplicationRecord
  #アソシエーション
  belongs_to :order
  has_one    :form_order
end
