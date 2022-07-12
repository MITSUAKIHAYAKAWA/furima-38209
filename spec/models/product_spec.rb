require 'rails_helper'

RSpec.describe Product, type: :model do

  before do
    @product = FactoryBot.build(:product)
  end

  describe "商品出品機能" do
    context "商品が出品できるとき" do
      it "image,descriptionが存在し、category_id, condition_id, delivery_charge_id, delivery_time_id, ship_form_idが'---'以外で、priceが半角数字かつ300~9,999,999の間なら出品できる" do
        expect(@product).to be_valid
      end
    end
    context "商品が出品できないとき" do
      it "imageが空だと出品できない" do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it "descriptionが空だと出品できない" do
        @product.description = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it "category_idが'---'だと出品できない" do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end
      it "condition_idが'---'だと出品できない" do
        @product.condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition must be other than 1")
      end
      it "delivery_charge_idが'---'だと出品できない" do
        @product.delivery_charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery charge must be other than 1")
      end
      it "delivery_time_idが'---'だと出品できない" do
        @product.delivery_time_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery time must be other than 1")
      end
      it "ship_form_idが'---'だと出品できない" do
        @product.ship_form_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Ship form must be other than 1")
      end
      it "priceが空だと出品できない" do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it "priceが全角だと出品できない" do
        @product.price = "５００"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it "priceが300円未満だと出品できない" do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが10,000,000以上だと出品できない" do
        @product.price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end
