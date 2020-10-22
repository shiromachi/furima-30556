class Item < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :description

    with_options numericality: { other_than: 1, message: 'を選択してください' } do
      validates :category_id
      validates :status_id
      validates :charge_type_id
      validates :area_id
      validates :day_to_ship_id
    end

    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は300〜9,999,999の間で入力してください' }
    validates :images
  end

  belongs_to :user, optional: true
  has_many_attached :images
  has_one :management
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :charge_type
  belongs_to_active_hash :area
  belongs_to_active_hash :day_to_ship
end
