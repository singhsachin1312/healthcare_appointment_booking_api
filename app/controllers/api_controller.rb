class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  attr_reader :current_user

  def authenticate_request
    unless user_id_in_token?
      render json: { message: "Invalid User Token", status: 401 }
      return
    end
    @current_user = User.find_by_id(auth_token[:user_id])
    rescue JWT::VerificationError, JWT::DecodeError
      render json: { message: "Invalid User Token", status: 401 }
  end

  private

  def http_token
    @http_token ||= if request.headers['Authorization'].present?
      request.headers['Authorization'].split(' ').last
    end
  end

  def auth_token
    auth_token ||= JsonWebToken.decode(http_token)
  end

  def user_id_in_token?
    http_token && auth_token && auth_token[:user_id].to_i
  end
end