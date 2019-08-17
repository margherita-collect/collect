class CartsController < ApplicationController
before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]


  def index
  	@cart_items = current_user.carts
  end

  def confirmation
    @cart_items = current_user.carts
    @user = User.new
  end

  def create
    # パラメータから商品IDを取得
    @cart_items = current_user.carts
    @product_id = params[:product_id]

    # カートの新規作成または個数追加
    if current_user.carts.find_by(product_id: @product_id)
      @cart = current_user.carts.find_by(product_id: @product_id)
      @cart.quantity = @cart.quantity.to_i + 1
    else
      @cart = current_user.carts.new(product_id: @product_id, quantity: 1)
    end

    # カートを保存
    if @cart.save
      flash[:add_cart] = "Successfully adding to cart"
      redirect_to products_path
    else
      flash[:add_cart] = "Failed to add to cart"
      render action: :index
    end
  end


end
