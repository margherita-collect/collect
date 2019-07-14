class ProductsController < ApplicationController

	#ログイン認証をスキップする
	skip_before_action :authenticate_user!

	def index
		@test = "test"
	end

	def show

	end
end