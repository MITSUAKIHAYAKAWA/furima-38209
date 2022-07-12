class Product < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :product_name, presence: true
  validates :image, attached_file_presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :ship_form_id, presence: true
  validates :delivery_time_id, presence: true
  validates :price, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[0-9]+\z/ }


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :ship_form
  belongs_to :delivery_time
end
