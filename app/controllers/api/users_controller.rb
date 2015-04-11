module API
  class UsersController < ApiController
      skip_before_action :authenticate_with_token!, only: :create
      before_action :get_user, except: :create

      def show
        render json: @user, response: :ok
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: user, status: :created, location: [:api, user]
        else
          render json: user.errors, status: :unprocessable_entity
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

      private
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end

      def get_user

         @user = User.find_by(id: params[:id])
         if @user.blank?
           render json: { errors: "User not found" }, status: :not_found
         end
      end
    end
end