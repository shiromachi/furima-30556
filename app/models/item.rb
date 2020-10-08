class Item < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :charge_type_id, presence: true
  validates :area_id, presence: true
  validates :day_to_ship_id, presence: true
  validates :price, presence: true

  belongs_to :user
end
