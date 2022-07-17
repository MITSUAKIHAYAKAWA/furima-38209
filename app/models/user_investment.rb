class UserInvestment
  include ActiveModel::Model
  attr_accessor :prefecture_id, :city, :block, :building, :postcode, :phone_number, :user_id, :product_id, :order_id, :token

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :block
    validates :postcode, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :user_id
    validates :product_id
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Address.create(prefecture_id: prefecture_id, city: city, block: block, building: building, postcode: postcode,
                   phone_number: phone_number, order_id: order.id)
  end
end
