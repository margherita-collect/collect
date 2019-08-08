class PurchasesController < ApplicationController
  def index
  	@purchases = current_user.purchases.all
  end

  def show
  	@purchases = current_user.purchases.all
  end

  def create
  	purchase = current_user.purchases.new(zip_code: current_user.zip_code, address: current_user.address)
	current_user.carts.each do |cart|
		purchase.purchase_products.new(product_id: cart.product_id, quantity: cart.quantity, price: cart.product.price, status: false)
	end
	if purchase.save
		current_user.carts.destroy_all
		redirect_to user_path(current_user)
	else
		redirect_to user_path(current_user)
	end
  end
end

