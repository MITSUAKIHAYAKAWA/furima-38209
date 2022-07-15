require 'rails_helper'

RSpec.describe UserInvestment, type: :model do
  before do
    @user_investment = FactoryBot.build(:user_investment)
  end

  describe "商品購入機能" do
    context "商品が購入できるとき" do
      it "cvcとnumberとexp_monthとexp_yearとphone_numberとprefecture_idとcityとblockとbuildingとpostcodeがあれば購入できる" do
        expect(@user_investment).to be_valid
      end
      it "buildingが空でも購入できる" do
        @user_investment.building = nil
        expect(@user_investment).to be_valid
      end
      it "電話番号が10桁でも購入できる" do
        @user_investment.phone_number = "0111111111"
        expect(@user_investment).to be_valid
      end
    end
    context "商品購入できないとき" do
      #it "cvcが空だと購入できない" do
        #@user_investment.cvc = nil
        #@user_investment.valid?
        #expect(@user_investment.errors.full_messages).to include("")
      #end
      #it "numberが空だと購入できない" do
        #@user_investment.number = nil
        #@user_investment.valid?
        #expect(@user_investment.errors.full_messages).to include("")
      #end
      #it "exp_monthが空だと購入できない" do
        #@user_investment.exp_month = nil
        #@user_investment.valid?
        #expect(@user_investment.errors.full_messages).to include("")
      #end
      #it "exp_yearが空だと購入できない" do
        #@user_investment.exp_year = nil
        #@user_investment.valid?
        #expect(@user_investment.errors.full_messages).to include("")
      #end
      it "phone_numberが空だと登録できない" do
        @user_investment.phone_number = nil
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberが(-)を含むと登録できない" do
        @user_investment.phone_number = "000-0000-0000"
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include("Phone number is invalid")
      end
      it "prefecture_idが(---)だと購入できない" do
        @user_investment.prefecture_id = 1
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "cityが空だと購入できない" do
        @user_investment.city = nil
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include("City can't be blank")
      end
      it "blockが空だと購入できない" do
        @user_investment.block = nil
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include("Block can't be blank")
      end
      it "postcodeが空だと購入できない" do
        @user_investment.postcode = nil
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include("Postcode can't be blank")
      end
      it "postcodeが3文字-4文字以外の組み合わせだと購入できない" do
        @user_investment.postcode = "1234-567"
        @user_investment.valid?
        expect(@user_investment.errors.full_messages).to include("Postcode is invalid")
      end
    end
  end
end
