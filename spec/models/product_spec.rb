require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    context '商品が出品できるとき' do
      it "image,descriptionが存在し、category_id, condition_id, delivery_charge_id, delivery_time_id, ship_form_idが'---'以外で、priceが半角数字かつ300~9,999,999の間なら出品できる" do
        expect(@product).to be_valid
      end
    end
    context '商品が出品できないとき' do
      it 'imageが空だと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("画像を入力してください")
      end
      it 'product_nameが空だと出品できない' do
        @product.product_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("商品名を入力してください")
      end
      it 'descriptionが空だと出品できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("商品の説明を入力してください")
      end
      it "category_idが'---'だと出品できない" do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('カテゴリーは1以外の値にしてください')
      end
      it "condition_idが'---'だと出品できない" do
        @product.condition_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('商品の状態は1以外の値にしてください')
      end
      it "delivery_charge_idが'---'だと出品できない" do
        @product.delivery_charge_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('配送料の負担は1以外の値にしてください')
      end
      it "delivery_time_idが'---'だと出品できない" do
        @product.delivery_time_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('発送までの日数は1以外の値にしてください')
      end
      it "ship_form_idが'---'だと出品できない" do
        @product.ship_form_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('発送元の地域は1以外の値にしてください')
      end
      it 'priceが空だと出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("価格を入力してください")
      end
      it 'priceが全角だと出品できない' do
        @product.price = '５００'
        @product.valid?
        expect(@product.errors.full_messages).to include('価格は数値で入力してください')
      end
      it 'priceが300円未満だと出品できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include('価格は300以上の値にしてください')
      end
      it 'priceが10,000,000以上だと出品できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end
      it 'userが紐づいていないと出品できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
