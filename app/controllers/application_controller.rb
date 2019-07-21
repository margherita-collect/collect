class ApplicationController < ActionController::Base

	# ユーザー登録時のオリジナルカラム使用を許可
	before_action :configure_permitted_parameters, if: :devise_controller?

	#ログイン認証済みのユーザーにのみページを表示する
	before_action :authenticate_user!

	def after_sign_in_path_for(resource)
  		admin_products_path
	end

	def after_sign_out_path_for(resource)
  		admin_products_path
	end

	protected
	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:surname, :firstname, :kana_surname,:kana_first_name,:phone_number,:zip_code,:address,:status])
  	end
end
