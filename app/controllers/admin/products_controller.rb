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
         redirect_to "/admin/products"
    end

    def index
        @products= Product.all
    end

    def show
        @products = Product.find(params[:id])
    end

    def edit
        @product = Product.find(params[:id])
    end

    def update
        @product = Product.find(params[:id])

        if  @product.update(product_params)
            flash[:notice] = "商品情報を編集しました"
            redirect_to admin_product_path(@product.id)
        else
            flash[:notice] = "商品情報の編集に失敗しました"
            render :edit
        end
    end


    private
    def product_params
        params.require(:product).permit(:product_name,:image,:label_id,:genre_id,:price,:stock,:status,:artist_id)
    end
end
