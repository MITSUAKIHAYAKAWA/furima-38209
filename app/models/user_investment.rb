class UserInvestment < ApplicationRecord

  include ActiveModel::Model
  attr_accessor :ship_form_id, :city, :block, :building, :postal, :phone, :buy, :token

  validates :token, presence: true 
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  validates :city, presence: true
  validates :block, presence: true
  validates :building
  validates :postal, presence: true, format: { with: /\A\d{3}[-]\d{4}\z/ }  
  validates :phone, presence: true, format: { with: /\A\d{10,11}\z/ }
  validates :buy, presence: true
  validates :token, presence: true
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  def save
    sell_item = Order.create(user_id: user_id, buy_id: buy_id, created_at: created_at, token: token)
    Address.create(postal: postal, prefecture_id: prefecture_id, city: city, block: block,
                    building: building, phone: phone, buy: buy )
  end
end
