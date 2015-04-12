class DashboardController < ApplicationController

  def country

    response = HTTParty.get("http://staging.gfw-apis.appspot.com/countries/#{params[:iso].upcase}")

    @data = response.to_hash
  end

end