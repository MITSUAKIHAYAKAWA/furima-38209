class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]


  def index
    @products = Product.all.order("id DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :image, :description, :category_id, :condition_id, :delivery_charge_id, :ship_form_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end
  
end
