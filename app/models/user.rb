class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :user_birthday
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'Full-width characters' } do
    validates :last_name
    validates :first_name
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' } do
    validates :last_name_kana
    validates :first_name_kana
  end

  # VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[\w-]+\z/i.freeze
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[\w-]+\z/i, message: 'Include both letters and numbers' }
  validates :password, presence: true

  # ゲストログインのため
  def self.guest
    find_or_create_by!(nickname: 'ゲスト', last_name: 'ゲスト', first_name: 'ゲスト', last_name_kana:'ゲスト', first_name_kana: 'ゲスト', user_birthday: '1930-01-01', email:'guest@guest.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end

  # アソシエーション
  has_many :animals
  has_many :comments, dependent: :destroy
end