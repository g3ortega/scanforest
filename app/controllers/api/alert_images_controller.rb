module API
    class AlertImagesController < API::ApiController
        #load_and_authorize_resource param_method: :image_params
        skip_before_action :authenticate_with_token!
        
        def create
            alert = Alert.find_by_id(params[:alert_id])
            alert_image = alert.alert_images.new(uploaded_image: params[:alert_image])
            if alert_image.save
                alert_image.url = request.protocol + request.host_with_port + alert_image.uploaded_image.url
                render json: alert_image, status: :created
            else
                render json: alert_image.errors, status: :unprocessable_entity
            end
        end
        
        private
        def image_params
            params.require(:alert_image).permit(:alert_image)
        end
    end
end