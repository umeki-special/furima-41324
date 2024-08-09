FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) + '1a' }
    password_confirmation { password }
    family_name           { Faker::Name.last_name }
    first_name            { Faker::Name.first_name }
    family_name_kana      { random_kana_string  }
    first_name_kana       { random_kana_string  }
    birth_day             { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end