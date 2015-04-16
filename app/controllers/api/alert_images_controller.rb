module API
    class AlertImagesController < API::ApiController
        #load_and_authorize_resource param_method: :image_params
        skip_before_action :authenticate_with_token!
        
        def create
            alert_image = Alert.find_by_id(params[:alert_id]).alert_images.new
            alert_image.image_data = params[:alert_image]
            #alert_image.user_id = current_user.id
            if alert_image.save
                render json: { success: 1 }, status: :created
            else
                render json: alert_image.errors, status: :unprocessable_entity
            end
        end
        
        private
        def image_params
            params.require(:alert_image).permit(:file_name,:content_type,:image_data)
        end
    end
end