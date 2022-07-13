class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_product, only: [:show, :edit, :update]
  before_action :move_to_index, only: [:edit]

  def index
    @products = Product.all.order('id DESC')
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

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to item_path(@product.id)
    else
      render :edit
    end
  end


  private

  def product_params
    params.require(:product).permit(:product_name, :image, :description, :category_id, :condition_id, :delivery_charge_id,
                                    :ship_form_id, :delivery_time_id, :price).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @product.user.id
      redirect_to root_path
    end
  end

end
