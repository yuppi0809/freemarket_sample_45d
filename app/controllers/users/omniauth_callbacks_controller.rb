class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback_from :facebook
  end

  def google_oauth2
    callback_from :google
  end

  def callback_from(provider)
    provider = provider.to_s
    auth = request.env['omniauth.auth']
    sns = SnsCredential.where(uid: auth.uid, provider: auth.provider).first
    session[:provider_name] = provider
    if sns.blank?
      session["devise.#{provider}_data"] = request.env['omniauth.auth'].except("extra")
      redirect_to new_user_registration_path
    else
      @user = sns.user
      sign_in_and_redirect @user, event: :authentication
    end
  end
end
