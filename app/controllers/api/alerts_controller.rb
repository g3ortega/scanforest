module API
  class AlertsController < API::ApiController
      load_and_authorize_resource
      skip_before_action :authenticate_with_token!, only: [:index, :show]

      def index
        render json: Alert.all, status: :ok
      end

      def show
        render json: @alert, response: :ok
      end

      def create
        @alert = current_user.alerts.new(alert_params)
        if @alert.save
          render json: @alert, status: :created
        else
          render json: @alert.errors, status: :unprocessable_entity
        end
      end

      def update
        if @alert.update(alert_params)
          render json: @alert, status: :ok, location: [:api, @alert]
        else
          render json: @alert.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @alert.destroy
        head :ok
      end

      def alert_params
        params.require(:alert).permit(:lat, :lon, :magnitude, :description, :area, :created, :alert_type)
      end
    end
end