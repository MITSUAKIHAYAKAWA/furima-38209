class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_product, only: [:index, :create]

  def index
    if @product.order.present? || current_user.id == @product.user.id
      redirect_to root_path
    else
      @user_investment = UserInvestment.new
    end
  end

  def create
    @user_investment = UserInvestment.new(order_params)
    if @user_investment.valid?
      @user_investment.save
      pay_item
      redirect_to root_path
    else
      @product = Product.find(params[:item_id])
      render :index
    end
  end

  private

  def order_params
    params.require(:user_investment).permit(:prefecture_id, :city, :block, :building, :postcode, :phone_number).merge(
      user_id: current_user.id, product_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_product
    @product = Product.find(params[:item_id])
  end
end
