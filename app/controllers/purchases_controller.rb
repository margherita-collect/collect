class PurchasesController < ApplicationController
  def index
  	@q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  	@purchases = current_user.purchases.all
  end

  def show
  	@q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  	@purchases = current_user.purchases.all
  end

  def createit
    if params[:zip_code].empty? && params[:address].empty?
  	  purchase = current_user.purchases.new(zip_code: current_user.zip_code, address: current_user.address)
    else
      purchase = current_user.purchases.new(zip_code: params[:zip_code], address: params[:address])
    end

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

