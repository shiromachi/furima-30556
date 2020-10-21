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
    validates :first_name, format: { with: NAME_REGEX, message: 'を全角（漢字・ひらがな・カタカナ）で入力してください' }
    validates :last_name, format: { with: NAME_REGEX, message: 'を全角（漢字・ひらがな・カタカナ）で入力してください' }
    validates :first_name_kana, format: { with: NAME_REGEX_KANA, message: 'を全角カタカナで入力してください' }
    validates :last_name_kana, format: { with: NAME_REGEX_KANA, message: 'を全角カタカナで入力してください' }
    validates :birthday
    validates :password, format: { with: PASSWORD_REGEX, message: 'を半角英数字混合で入力してください' }
  end

  has_many :items
  has_many :managements
  has_many :comments
end
