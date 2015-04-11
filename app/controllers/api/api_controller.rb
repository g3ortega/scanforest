module API
  class ApiController < ApplicationController
    before_action :authenticate_with_token!
    include Authenticable

  end
end