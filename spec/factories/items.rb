# spec/factories/items.rb
FactoryBot.define do
  factory :item do
    association :user
    name { "Sample Item" }
    description_of_item { "This is a sample item description." }
    price { 300 }
    category_id { 2 }  
    status_id { 2 }    
    shipping_method_id { 2 } 
    region_of_origin_id { 2 }
    estimated_shipping_date_id { 2 } 
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/files/test_image.jpg'), 'image/jpeg') }
  end
end
