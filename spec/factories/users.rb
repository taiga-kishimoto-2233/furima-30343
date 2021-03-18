FactoryBot.define do
  factory :user do
    nickname              { 'test123' }
    email                 { 'test123@test.com' }
    password              { 'test123' }
    password_confirmation { 'test123' }
    last_name             { 'う' }
    first_name            { 'う' }
    last_name_f           { 'ウ' }
    first_name_f          { 'ウ' }
    birthday              { '1930-01-01' }
  end
end
