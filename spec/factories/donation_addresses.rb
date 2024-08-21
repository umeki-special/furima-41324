FactoryBot.define do
  factory :order_form do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address { '1-1' }
    address2 { 'アパート101' }
    building { '東京ハイツ' }
    phone_number { '09012345678' }
  end
end
