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
    @user = User.find_for_oauth(request.env['omniauth.auth'])

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devise.#{provider}_data"] = request.env['omniauth.auth'].except("extra")
      redirect_to new_user_registration_path
    end
  end
end
