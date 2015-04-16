class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  %w{google_oauth2 github}.each do |method|
    define_method(method) do
      @user = User.find_for_omniauth(request.env["omniauth.auth"], current_user)
      if @user.persisted?
        set_flash_message(:notice, :success, :kind => method.humanize) if is_navigational_format?
        sign_in_and_redirect @user, :event => :authentication
      else
        session["devise.#{method}_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
      end
    end
  end

end