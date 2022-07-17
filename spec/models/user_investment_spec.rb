require 'rails_helper'

RSpec.describe UserInvestment, type: :model do
  before do
    user = FactoryBot.create(:user)
    product = FactoryBot.create(:product)
    @user_investment = FactoryBot.build(:user_investment, user_id: user.id, product_id: product.id)
  end

  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it 'tokenとphone_numberとprefecture_idとcityとblockとbuildingとpostcodeがあれば購入できる' do
        expect(@user_investment).to be_valid
      end
      it 'buildingが空でも購入できる' do
        @user_investment.building = nil
        expect(@user_investment).to be_valid
      end
      it '電話番号が10桁でも購入できる' do
        @user_investment.phone_number = '0111111111'
        expect(@user_investment).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'tokenが空だと購入できない' do
        @user_investment.token = nil
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include("Token can't be blank")
      end
      it 'phone_numberが空だと登録できない' do
        @user_investment.phone_number = nil
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが(-)を含むと登録できない' do
        @user_investment.phone_number = '000-0000-0000'
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include('Phone number is invalid')
      end
      it 'prefecture_idが(---)だと購入できない' do
        @user_investment.prefecture_id = 1
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが空だと購入できない' do
        @user_investment.city = nil
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと購入できない' do
        @user_investment.block = nil
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include("Block can't be blank")
      end
      it 'postcodeが空だと購入できない' do
        @user_investment.postcode = nil
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include("Postcode can't be blank")
      end
      it 'postcodeが3文字-4文字以外の組み合わせだと購入できない' do
        @user_investment.postcode = '1234-567'
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include('Postcode is invalid')
      end
      it "postcodeが(-)なしだと購入できない" do
        @user_investment.postcode = '1234567'
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include('Postcode is invalid')
      end
      it "phone_numberが9桁いかだと購入できない" do
        @user_investment.phone_number = '090000000'
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include('Phone number is invalid')
      end
      it "phone_numberが12桁以上だと購入できない" do
        @user_investment.phone_number = '090000000000'
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include('Phone number is invalid')
      end
      it "user_idが空だと購入できない" do
        @user_investment.user_id = nil
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include("User can't be blank")
      end
      it "product_idが空だと購入できない" do
        @user_investment.product_id = nil
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end