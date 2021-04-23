FactoryBot.define do
  factory :purchase_address do
    token         { 'tok_abcdefghijk00000000000000000' }
    postal_code   { '111-1111' }
    area_id       { 48 }
    municipality  { '横浜市西区' }
    address       { 'みなとみらい1-1-1' }
    building      { '〇〇ビル△△階' }
    phone_number  { '09012345678' }
    # user_id       { 2 }
    # item_id       { 18 }
  end
end
