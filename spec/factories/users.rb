FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6, mix_case: false) }
    password_confirmation { password }
    first_name            { ForgeryJa(:name).first_name }
    last_name             { ForgeryJa(:name).last_name }
    first_name_kana       { ForgeryJa(:name).first_name(to: ForgeryJa::KANA) }
    last_name_kana        { ForgeryJa(:name).last_name(to: ForgeryJa::KANA) }
    birthday              { Faker::Date.birthday }
  end
end
