class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana,
      :birth_year, :birth_month, :birth_day, :verify_sms,
        profile_attributes: [
          :prefecture, :city, :address, :postal_code, :building_name,
          :telephone_num, :delv_first_name, :delv_last_name,
          :delv_first_name_kana, :delv_last_name_kana
        ],
        payments_attributes: [
          :card_num, :expiration_month, :expiration_year, :security_code
        ]
      ])
  end
end
