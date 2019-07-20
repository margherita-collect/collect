class ProductsController < ApplicationController

	#ログイン認証をスキップする
	skip_before_action :authenticate_user!

	def index
		 @products= Product.all
	end

	def show
		 @products = Product.find(params[:id])
	end
end