class ManagementOrder
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :token, :postal_code, :region_id, :city, :street, :building, :phone, :management_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :region_id, numericality: { other_than: 1 }
    validates :city
    validates :street
    validates :phone, length: { maximum: 11 }, format: { with: /\d/, message: 'is invalid. Input half-width characters' }
  end
  def save
    management = Management.create(item_id: item_id, user_id: user_id)
    Order.create(postal_code: postal_code, region_id: region_id, city: city, street: street, building: building, phone: phone, management_id: management.id)
  end
end
