class Admin::ProductsController < ApplicationController

  	# アドミンユーザ以外のアクセスを防ぐ
    skip_before_action :authenticate_user!
	before_action :authenticate_admin!

    def new
        @product = Product.new
        @labels = Label.all
        @genres = Genre.all
        @artists = Artist.all
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

    def registration
        @label = Label.new
        @artist = Artist.new
        @genre = Genre.new
        @labels = Label.all
    end


    # label, artist, genre の新規登録を行う
    def create_registration

        # label項目に入力があるかの確認を行う
        if params[:label][:label_name].present?
            label = Label.new(label_params)
            if !label.save
                redirect_to "/admin/products/"
                return
            end
        end

        # artist項目に入力があるかの確認を行う
        if params[:artist][:artist_name].present?
            artist = Artist.new(artist_params)
            if !artist.save
                redirect_to "/admin/products/"
                return
            end
        end

        # genre項目に入力があるかの確認を行う
        if params[:genre][:genre_name].present?
            genre = Genre.new(genre_params)
            if !genre.save
                redirect_to "/admin/products/"
                return
            end
        end

        # 新規マスター登録画面へリダイレクト
        redirect_to "/admin/master_registration/"
        return
    end

    private
    # def product_params
    #     params.require(:product).permit(:product_name,:image,:label_id,:genre_id,:price,:stock,:status,:artist_id)
    # end

    def label_params
        params.require(:label).permit(:label_name)
    end

    def artist_params
        params.require(:artist).permit(:artist_name)
    end

    def genre_params
        params.require(:genre).permit(:genre_name)
    end

    #ネストされたフォーム情報の取得
    def reciep_params
        params.require(:product).permit(:proudct_name, :image, :label_id, :genre_id, :price, :stock, :status, :artist_id, discs_attributes: [:id, :disc_name, :_destroy, songs_attributes: [:id, :song_name, :_destroy]])
    end
end
