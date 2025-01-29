class MetaController < ApplicationController

    def ping
      render json: SuccessResponse(nil, "pong!")
    end

    def health_check
      render json: SuccessResponse(nil, "OK!")
    end

    def version
      render json: SuccessResponse(nil, Rails.configuration.app_version)
    end
end