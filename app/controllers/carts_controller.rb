class CartsController < ApplicationController
before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]


  def index
  	@cart_items = current_cart.carts
  end

  def add_item
    if @cart_item.blank?
      @cart_item = current_cart.carts.build(product_id: params[:product_id])
    end

#a += 1 a の値をひとつ加算する
    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to current_cart
  end

  def update_item
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

  def delete_item
    @cart_item.destroy
    redirect_to current_cart
  end

  private

  def setup_cart_item!
    @cart_item = current_cart.carts.find_by(product_id: params[:product_id])
  end


end
