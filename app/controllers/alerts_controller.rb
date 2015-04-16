class AlertsController < ApplicationController
  def new
  end

  def create
    # Strong parameters doesn't support hashes with unknown keys, so we handle
    # that separately
    @alert = Alert.new(alert_params.merge(description: params[:alert][:description]))
    @alert.save!
    @alert.alert_images.create!(uploaded_image: params[:alert][:image])
    redirect_to map_path
  end

private
  def alert_params
    params.require(:alert).permit(:lat, :lon, :magnitude, :area, :address, :description, :alert_type)
  end
end
