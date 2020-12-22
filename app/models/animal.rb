class Animal < ApplicationRecord

  self.inheritance_column = :_type_disabled
  
  validates :image,              presence: true
  validates :animal_name,        presence: true
  validates :current_location,   presence: true
  validates :animal_age,         presence: true
  validates :type,               presence: true
  validates :background,         presence: true
  validates :personality,        presence: true
  validates :health,             presence: true
  validates :transfer_method,    presence: true

  # アクティブハッシュの選択が「---」の時は保存されない
  validates :male_female_id, :vaccine_id, numericality: { other_than: 1, message: 'Status Select' }

  # アソシエーション
  belongs_to :user
  has_one   :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :male_female
  belongs_to :vaccine

end
