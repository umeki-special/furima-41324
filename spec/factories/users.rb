FactoryBot.define do
  factory :user do
    nickname { 'valid' } # ここでの長さが6文字以内であることを確認
    sequence(:email) { |n| "user#{n}@example.com" }
    password { "password123" }
    password_confirmation { "password123" }
    family_name { "山田" }
    first_name { "太郎" }
    family_name_kana { "ヤマダ" }
    first_name_kana { "タロウ" }
    birth_day { "2000-01-01" }
  end
end