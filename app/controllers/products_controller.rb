class ProductsController < ApplicationController

	#ログイン認証をスキップする
	skip_before_action :authenticate_user!

	def index
		 #ViewのFormで取得したパラメータをモデルに渡す
    	 @products = Product.search(params[:search])
		 @cart = Cart.new
	end

	def show
		 @product = Product.find(params[:id])
		 @cart = Cart.new
		 @stock_array = [1,2,3,4,5,6,7,8,9,10]
		 @product.stock.to_i.times do |quantity|
		 	if quantity < 10
		 		@stock_array.push(quantity + 1)
		 	else
		 		break
		 	end
		 end
	end
end