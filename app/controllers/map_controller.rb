class MapController < ApplicationController
  def index
    @alerts = Alert.all
  end
end
