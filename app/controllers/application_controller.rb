class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:surname, :first_name, :kana_surname,:kana_first_name,:phone_number,:zip_code,:address,:status])
  end

end
