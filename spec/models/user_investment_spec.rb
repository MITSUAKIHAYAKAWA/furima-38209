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
        expect(@user_investment.errors.full_messages).to include("クレジットカード情報を入力してください")
      end
      it 'phone_numberが空だと登録できない' do
        @user_investment.phone_number = nil
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberが(-)を含むと登録できない' do
        @user_investment.phone_number = '000-0000-0000'
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include('電話番号は不正な値です')
      end
      it 'prefecture_idが(---)だと購入できない' do
        @user_investment.prefecture_id = 1
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include('都道府県は1以外の値にしてください')
      end
      it 'cityが空だと購入できない' do
        @user_investment.city = nil
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'blockが空だと購入できない' do
        @user_investment.block = nil
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include("番地を入力してください")
      end
      it 'postcodeが空だと購入できない' do
        @user_investment.postcode = nil
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'postcodeが3文字-4文字以外の組み合わせだと購入できない' do
        @user_investment.postcode = '1234-567'
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it "postcodeが(-)なしだと購入できない" do
        @user_investment.postcode = '1234567'
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it "phone_numberが9桁いかだと購入できない" do
        @user_investment.phone_number = '090000000'
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include('電話番号は不正な値です')
      end
      it "phone_numberが12桁以上だと購入できない" do
        @user_investment.phone_number = '090000000000'
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include('電話番号は不正な値です')
      end
      it "user_idが空だと購入できない" do
        @user_investment.user_id = nil
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include("Userを入力してください")
      end
      it "product_idが空だと購入できない" do
        @user_investment.product_id = nil
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include("Productを入力してください")
      end
    end
  end
end
