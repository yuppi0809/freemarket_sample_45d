# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  # before_action :configure_account_update_params, only: [:update]

  def new
    provider = session[:provider_name]
    password = Devise.friendly_token[0,20]
    @user = User.new
    if session["devise.#{provider}_data"]
      @user.nickname = session["devise.#{provider}_data"]["info"]["name"]
      @user.email = session["devise.#{provider}_data"]["info"]["email"]
      @user.password = password
      @user.password_confirmation = password
    end
  end

  def create
    provider = session[:provider_name]
    if session["devise.#{provider}_data"]
      sns = SnsCredential.new(uid: session["devise.#{provider}_data"]["uid"], provider: session["devise.#{provider}_data"]["provider"])
    end
    super
    unless sns.blank?
      sns.user_id = session["warden.user.user.key"][0][0]
      sns.save
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :nickname,
      :first_name,
      :last_name,
      :first_name_kana,
      :last_name_kana,
      :birth_year,
      :birth_month,
      :birth_day,
      :verify_sms,
      profile_attributes: [
        :prefecture_id,
        :city,
        :address,
        :postal_code,
        :building_name,
        :telephone_num,
        :delv_first_name,
        :delv_last_name,
        :delv_first_name_kana,
        :delv_last_name_kana
      ],
      payments_attributes: [
        :card_num,
        :expiration_month,
        :expiration_year,
        :security_code
      ]
    ])
  end

  def after_sign_up_path_for(resource)
    complete_path
  end

  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end
end
