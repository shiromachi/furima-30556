class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  NAME_REGEX_KANA = /\A([ァ-ン]|ー)+\z/.freeze
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: NAME_REGEX, message: 'is invalid. Input full-width characters' }
    validates :last_name, format: { with: NAME_REGEX, message: 'is invalid. Input full-width characters' }
    validates :first_name_kana, format: { with: NAME_REGEX_KANA, message: 'is invalid. Input full-width katakana characters' }
    validates :last_name_kana, format: { with: NAME_REGEX_KANA, message: 'is invalid. Input full-width katakana characters' }
    validates :birthday
    validates :password, format: { with: PASSWORD_REGEX, message: 'is invalid. Input half-width characters and contain both letters and numbers' }
  end

  has_many :items
end
