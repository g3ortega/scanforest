class AlertsController < ApplicationController
  def new
  end

  def create
    # Strong parameters doesn't support hashes with unknown keys, so we handle
    # that separately
    @alert = Alert.new(alert_params.merge(description: params[:alert][:description]))
    @alert.save
    redirect_to @alert
  end

private
  def alert_params
    params.require(:alert).permit(:lat, :lon, :magnitude, :area)
  end
end
