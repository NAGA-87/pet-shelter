class Order < ApplicationRecord
  belongs_to :user
  belongs_to :animal
  has_one    :parents_info
  has_one    :form_order
end
