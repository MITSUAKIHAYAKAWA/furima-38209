class DeliveryTime < ActiveHash::Base
  include ActiveHash::Associations
  has_many :products
end
