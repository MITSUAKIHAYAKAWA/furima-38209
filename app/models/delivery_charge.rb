class DeliveryCharge < ActiveHash::Base
  include ActiveHash::Associations
  has_many :products
end
