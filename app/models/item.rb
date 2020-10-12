class Item < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :description
    validates :category_id,    numericality: { other_than: 1 }
    validates :status_id,      numericality: { other_than: 1 }
    validates :charge_type_id, numericality: { other_than: 1 }
    validates :area_id,        numericality: { other_than: 1 }
    validates :day_to_ship_id, numericality: { other_than: 1 }
    validates :price,          numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"},
                               format: { with: /\d/, message: 'is invalid. Input half-width numbers' }
  end
  belongs_to :user, optional: true
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :charge_type
  belongs_to_active_hash :area
  belongs_to_active_hash :day_to_ship
end
