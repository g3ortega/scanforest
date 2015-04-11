module Authenticable

  # Devise methods overwrites
  def current_user
    authenticate_with_http_token do |token, options|
      @current_user ||= User.find_by(auth_token: token)
    end
  end

  def authenticate_with_token!
    unless user_signed_in?
      self.headers['WWW-Authenticate'] = "Token realm=\"Application\""
      render json: { errors: "HTTP Token: Access denied." }, status: :unauthorized
    end
  end

  def user_signed_in?
    current_user.present?
  end
end