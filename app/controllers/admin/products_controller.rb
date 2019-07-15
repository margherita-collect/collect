class Admin::ProductsController < ApplicationController

  	# アドミンユーザ以外のアクセスを防ぐ
    skip_before_action :authenticate_user!
	  before_action :authenticate_admin!

    def new
        @product = Product.new
    end

    def create
        # ストロングパラメーターを使用
         product = Product.new(product_params)
        # DBへ保存する
         product.save
        # トップ画面へリダイレクト
         redirect_to "admin/products"
    end

    def index
        @test = "admin/products/index"
    end

    def show
    end

    def edit
    end

    def update
    end


    private
    def product_params
        params.require(:product).permit(:product_name,:image,:label_id,:genre_id,:price,:stock,:status,:artist_id)
    end
end
