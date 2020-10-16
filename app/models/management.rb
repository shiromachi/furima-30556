class Management < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item, optional: true
  has_one :order
end
