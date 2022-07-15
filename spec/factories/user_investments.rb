FactoryBot.define do
  factory :user_investment do
    #cvc                 { 123 }
    #exp_year            { 33 }
    #exp_month           { 3 }
    #number              { 4242424242424242 }
    postcode            { "123-2345" }
    prefecture_id       { Faker::Number.between(from: 2, to: 48) }
    city                { Faker::Lorem.sentence }
    block               { Faker::Lorem.sentence }
    building            { Faker::Lorem.sentence }
    phone_number        { Faker::Number.leading_zero_number(digits: 11)}

  end
end
