class CartsController < ApplicationController
before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]


  def index
  	@cart_items = current_user.carts
    @q = Product.ransack(params[:q])
    @products = @q.result(distinct: true)
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
    product_id = params[:product_id]

    # カートの新規作成または個数追加
    if current_user.carts.find_by(product_id: product_id)
      cart = current_user.carts.find_by(product_id: product_id)
      cart.quantity = cart.quantity.to_i + 1
    else
      cart = current_user.carts.new(product_id: product_id, quantity: 1)
    end

    # カートを保存
    if cart.save
      flash[:add_cart] = "Successfully adding to cart"
      redirect_to products_path
    else
      flash[:add_cart] = "Failed to add to cart"
      render_to products_path
    end
  end





  def add_item
    if @cart_item.blank?
      @cart_item = current_cart.carts.build(product_id: params[:product_id])
    end

#a += 1 a の値をひとつ加算する
    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to current_cart
  end

  def update_item
    @cart_item.update(quantity: params[:quantity].to_i)
    redirect_to current_cart
  end

  def delete_item
    @cart_item.destroy
    redirect_to current_cart
  end

  private

  def setup_cart_item!
    @cart_item = current_cart.carts.find_by(product_id: params[:product_id])
  end


end
