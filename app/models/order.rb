class Order < ApplicationRecord
  has_one :address
  belongs_to :product
  belongs_to :user
end
