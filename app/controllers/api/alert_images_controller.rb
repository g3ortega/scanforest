module API
    class AlertImagesController < API::ApiController
        #load_and_authorize_resource param_method: :image_params
        skip_before_action :authenticate_with_token!
        
        def create
            alert = Alert.find_by_id(params[:alert_id])
            alert_image = alert.alert_images.create!(uploaded_image: params[:alert_image])
            if alert_image.persisted?
                render json: alert_image, status: :created
            else
                render json: alert_image.errors, status: :unprocessable_entity
            end
        end
        
        private
        def image_params
            params.require(:alert_image).permit(:alert_image,:alert_id)
        end
    end
end