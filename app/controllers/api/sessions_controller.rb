module API
class SessionsController < API::ApiController
  skip_before_action :authenticate_with_token!, only: :create
  def create
    user_try = session_params
    user = User.find_by(email: user_try[:email])

    if user.present? && user.valid_password?(user_try[:password])
      sign_in user, store: false
      user.generate_auth_token!
      user.save!
      render json: {token: user.auth_token}, status: :ok, location: [:api, user]
    else
      render json: { errors: "Invalid email or password" }, status: :unauthorized
    end
  end

  def destroy
    user = User.find_by(auth_token: params[:id])
    user.generate_auth_token!
    user.save
    head 204
  end

  private

  def session_params
    params.require(:email)
    params.require(:password)
    params.permit(:email, :password)
  end
end
end