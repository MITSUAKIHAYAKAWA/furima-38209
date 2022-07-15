class UserInvestment

  include ActiveModel::Model
  attr_accessor :prefecture_id, :city, :block, :building, :postcode, :phone_number, :user_id, :product_id
  
  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :block
    validates :postcode, format: { with: /\A\d{3}[-]\d{4}\z/ }  
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end
  validate :building
  

  def save
    Order.create(user_id: current_user.id, product_id: params[:product.id])
    Address.create(postal: postal, prefecture_id: prefecture_id, city: city, block: block,
                    building: building, phone: phone, user_id: current_user.id )
  end
end
