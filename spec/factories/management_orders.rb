FactoryBot.define do
  factory :management_order do
    token       {"tok_abcdefghijk00000000000000000"}
    postal_code {"123-4567"}
    region_id   { Faker::Number.between(from: 2, to: 48) }
    city        { Faker::Address.city }
    street      { Faker::Address.street_address }
    building    { Faker::Address.building_number }
    phone       { Faker::Number.number(digits: 11) }
  end
end
