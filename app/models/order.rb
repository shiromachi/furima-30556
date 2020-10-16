class Order < ApplicationRecord
  belongs_to :management, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :region
end
