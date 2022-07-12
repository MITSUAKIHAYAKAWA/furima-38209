FactoryBot.define do
  factory :product do
    product_name       {Faker::Name}
    category_id        {Faker::Number.between(from: 2, to: 11)}
    condition_id       {Faker::Number.between(from: 2, to: 7)}
    description        {Faker::Lorem.sentence}
    delivery_charge_id {Faker::Number.between(from: 2, to: 3)}
    price              {Faker::Number.between(from: 300, to: 9_999_999)}
    delivery_time_id   {Faker::Number.between(from: 2, to: 4)}
    ship_form_id       {Faker::Number.between(from: 2, to: 48)}
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open("public/images/test_image.png"), filename: "test_image.png")
    end
  end
end
