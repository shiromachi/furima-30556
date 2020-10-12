FactoryBot.define do
  factory :item do
    title          { Faker::Lorem.word }
    description    { Faker::Lorem.sentence }
    category_id    { Faker::Number.between(from: 2, to: 11) }
    status_id      { Faker::Number.between(from: 2, to: 7) }
    charge_type_id { Faker::Number.between(from: 2, to: 3) }
    area_id        { Faker::Number.between(from: 2, to: 48) }
    day_to_ship_id { Faker::Number.between(from: 2, to: 4) }
    price          { Faker::Number.between(from: 300, to: 9999999) }

    after(:build) do |picture|
      picture.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end