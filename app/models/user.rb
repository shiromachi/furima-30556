class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

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
  has_many :sns_credentials
  
  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    user = User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )

    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
