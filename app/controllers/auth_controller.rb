class AuthController < ApplicationController
  include AuthHelper
  protect_from_forgery with: :null_session

  def send_jwt_token
    @message = params[:message]
    @token = create_jwt_from_string(@message)
    render json: SuccessResponse({token: @token})
  end

  def send_hash
    @message = params[:message]
    @hash = create_hash(@message)
    render json: SuccessResponse({hash: @hash})
  end

  def send_totp_code
    @message = params[:message]
    @code = create_totp(@message)
    render json: SuccessResponse({code: @code})
  end
end