class SessionController < API::ApiController
  def create
    user_password = params[:session][:password]
    user_email = params[:session][:email]
    user = user_email.present? && User.find_by(email: user_email)

    if user.valid_password? user_password
      sign_in user, store: false
      user.generate_auth_token!
      user.save
      render json: user, status: :ok, location: [:api, user]
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
end