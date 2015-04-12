module API
  class ApiController < ApplicationController
    before_action :authenticate_with_token!

    rescue_from CanCan::AccessDenied do |exception|
      render json: {error: "Access denied!" }, status: :forbidden
    end

    rescue_from ActiveRecord::RecordNotFound do |exception|
      render json: {error: "No record found!" }, status: :not_found
    end

    include Authenticable

    def default_serializer_options
      {root: false}
    end
  end
end