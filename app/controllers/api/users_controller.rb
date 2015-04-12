module API
  class UsersController < API::ApiController
      skip_before_action :authenticate_with_token!, only: :create
      load_and_authorize_resource

      def show
        render json: @user, response: :ok
      end

      def create
        if @user.save
          render json: @user, status: :created, location: [:api, @user]
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def update
        if @user.update(user_params)
          render json: @user, status: :ok, location: [:api, @user]
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @user.destroy
        head 204
      end

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :role)
      end

      # def get_user
      #    @user = User.find_by(id: params[:id])
      #    if @user.blank?
      #      render json: { errors: "User not found" }, status: :not_found
      #    end
      # end
    end
end