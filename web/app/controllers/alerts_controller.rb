class AlertsController < ApplicationController
  def new
  end

  def create
      @alert = Alert.new(alert_params)
      @alert.save
      redirect_to @alert
  end

private
  def alert_params
    params.require(:alert).permit(:lat, :lon, :magnitude, :area, description: [:reason1])
  end
end
