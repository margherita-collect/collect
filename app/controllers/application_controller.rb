class ApplicationController < ActionController::Base

	# ユーザー登録時のオリジナルカラム使用を許可
	before_action :configure_permitted_parameters, if: :devise_controller?

	#ログイン認証済みのユーザーにのみページを表示する
	before_action :authenticate_user!

	#コントローラーにあるメソッドをヘルパーのようにビューで使う。これを定義することで、セッション情報を元に、現在のカートを呼び出すことができるようになる
	helper_method :current_cart

	def current_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
    end

	def after_sign_in_path_for(resource)
		case resource
		when User
			products_path
		when Admin
			admin_products_path
		end
	end

	def after_sign_out_path_for(resource)
		products_path
	end

	protected
	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:surname, :firstname, :kana_surname,:kana_first_name,:phone_number,:zip_code,:address,:status])
  	end

	def authenticate_admin!
		if admin_signed_in?
			super
		else
			redirect_to "/public/404.html"
		end
	end
end
