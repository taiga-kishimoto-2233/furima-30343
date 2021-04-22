FactoryBot.define do
  factory :purchase_address do
    number        { '4242424242424242' }
    exp_month     { '3' }
    exp_year      { '33' }
    cvc           { '123' }
    postal_code   { '111-1111' }
    area_id       { 48 }
    municipality  { '横浜市西区' }
    address       { 'みなとみらい1-1-1' }
    building      { '〇〇ビル△△階' }
    phone_number  { '09012345678' }
    user_id       { 2 }
    item_id       { 18 }
  end
end
