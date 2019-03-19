class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # callback for facebook
  # def facebook
  #   callback_for(:facebook)
  # end

  # # callback for twitter
  # def twitter
  #   callback_for(:twitter)
  # end

  # callback for google
  def google_oauth2
    callback_from :google
  end

  # common callback method
  def callback_from(provider)
    provider = provider.to_s
    auth = request.env['omniauth.auth']
    sns = SnsCredential.where(uid: auth.uid, provider: auth.provider).first

    if sns.blank?
      session["devise.#{provider}_data"] = request.env['omniauth.auth'].except("extra")
      redirect_to new_user_registration_path
    else
      @user = sns.user
      sign_in_and_redirect @user, event: :authentication
    end
  end
end
