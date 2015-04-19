class AlertsController < ApplicationController
  load_and_authorize_resource
  def index
    @all_alerts = Alert.all
    @my_alerts = current_user.alerts if user_signed_in?
  end

  def new
  end
  
  def destroy
    @alert.destroy 
    redirect_to alerts_path
  end

  def create
    # Strong parameters doesn't support hashes with unknown keys, so we handle
    # that separately
    @alert = current_user.alerts.new(alert_params)
    @alert.save!
    @alert.alert_images.create!(uploaded_image: params[:alert][:image])
    redirect_to map_path
  end

private
  def alert_params
    params.require(:alert).permit(:lat, :lon, :magnitude, :area, :address, :description, :alert_type)
  end
end
