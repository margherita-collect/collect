class CartsController < ApplicationController
before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]


  def index
  	@cart_items = current_user.carts
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
  end

 def confirmation
  @cart_items = current_user.carts
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
    @users = User.all
    @user = User.new
  end

  def cart_destroy
    item = Cart.find(params[:cart_id])
    item.destroy
    render body: nil
  end

  def cart_update
    item = Cart.find(params[:cart_id])
    item.quantity = params[:quantity]
    item.save
    render body: nil
  end

  def create
    # パラメータから商品IDを取得
    @cart_items = current_user.carts
    @product_id = params[:product_id]
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)

    # カートの新規作成または個数追加
    if @cart_items.find_by(product_id: @product_id)
      @cart = @cart_items.find_by(product_id: @product_id)
      @cart.quantity = @cart.quantity.to_i + 1
    else
      @cart = @cart_items.new(product_id: @product_id, quantity: 1)
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
