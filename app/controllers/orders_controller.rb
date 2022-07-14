class OrdersController < ApplicationController

  def index
    @user_investment = UserInvestment.new
  end
end
