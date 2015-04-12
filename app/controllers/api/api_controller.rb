module API
  class ApiController < ApplicationController
    before_action :authenticate_with_token!

    rescue_from Exception do |exception|
      error = case
                when exception.is_a?(CanCan::AccessDenied)
                  { error: "Access denied!", status: :forbidden }
                when exception.is_a?(ActiveRecord::RecordNotFound)
                  { error:  "No record found!", status: :not_found }
                when exception.is_a?(ActionController::RoutingError)
                  { error: "Invalid path!", status: :bad_request }
                else { error: exception.message, status: :bad_request }
              end
      render json: error
    end

    include Authenticable

    def default_serializer_options
      {root: false}
    end
  end
end