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
        @alert.user_id = current_user.id
        if @alert.save
          #@alert.alert_images.create!(uploaded_image: process_image)
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
        params.require(:alert).permit(:lat, :lon, :magnitude, :description, :area, :created)
      end

      def process_image
        if params[:alert] && params[:alert][:photo]
          data = StringIO.new(Base64.decode64(params[:alert][:photo][:data]))
          data.class.class_eval { attr_accessor :filename, :content_type }
          data.original_filename = params[:alert][:photo][:filename]
          data.content_type = params[:alert][:photo][:content_type]
          params[:alert][:uploaded_image] = data
        end
      end
    end
end