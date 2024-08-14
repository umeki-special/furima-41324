FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.unique.email }  # Ensure unique email
    password              { 'Password1' }  # Valid password
    password_confirmation { password }
    
    family_name           { Faker::Name.last_name }
    first_name            { Faker::Name.first_name }
    family_name_kana      { Faker::Name.last_name.tr('一-龥々', 'ァ-ヶ') }
    first_name_kana       { Faker::Name.first_name.tr('一-龥々', 'ァ-ヶ') }
    birth_day             { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
