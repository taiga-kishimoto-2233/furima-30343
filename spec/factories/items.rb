FactoryBot.define do
  factory :item do
    name            { 'テスト商品' }
    text            { 'テスト商品説明' }
    category_id     { '2' }
    states_id       { '2' }
    charge_id       { '2' }
    area_id         { '2' }
    exhibit_date_id { '2' }
    price           { '333' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
