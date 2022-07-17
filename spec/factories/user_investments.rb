FactoryBot.define do
  factory :user_investment do
    token               { 'tok_abcdefghijk00000000000000000' }
    postcode            { '123-2345' }
    prefecture_id       { Faker::Number.between(from: 2, to: 48) }
    city                { Faker::Lorem.sentence }
    block               { Faker::Lorem.sentence }
    building            { Faker::Lorem.sentence }
    phone_number        { Faker::Number.leading_zero_number(digits: 11) }
  end
end
