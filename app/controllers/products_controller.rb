class ProductsController < ApplicationController

	#ログイン認証をスキップする
	skip_before_action :authenticate_user!

	def index
		 #ViewのFormで取得したパラメータをモデルに渡す
    	 @product = Product.search(params[:search])
		 @products= Product.all
		 @cart = Cart.new
	end

	def show
		 @products = Product.find(params[:id])
		 @cart = Cart.new
		 @stock_array = []
		 @products.stock.times do |quantity|
		 	if quantity < 10
		 		@current_stock_array += quantity + 1
		 	else
		 		break
		 	end
		 end
	end
end