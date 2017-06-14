require 'jwt'

class ApplicationController < ActionController::API
  include ControllerHelper

  before_action :authenticate_request!, unless: -> { request.get? }, except: :authenticate_user
  attr_reader :current_user

  protected
  def render_error (inst_var) #check this is not an action!!!!
    render json: format_error(inst_var.errors), status: 400, response_code: 400
  end

  def authenticate_request!
    unless user_id_in_token?
      render json: {errors: ['Not Authenticated']}, status: :unauthorized
      return
    end
    @current_user = User.find(auth_token[:user_id])
  rescue JWT::VerificationError, JWT::DecodeError
    not_auth = 'Not Authenticated'
    logger.error not_auth
    render json: {errors: [not_auth]}, status: :unauthorized
  rescue ActiveRecord::RecordNotFound
    not_found = 'User is not found. Try to get new token for existing user'
    logger.error(not_found)
    render json: {errors: [not_found]}, status: 404
  end

  private
  def http_token
    @http_token ||= if request.headers['Authorization'].present?
                      request.headers['Authorization'].split(' ').last
                    end
  end

  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  def user_id_in_token?
    http_token && auth_token && auth_token[:user_id].to_i
  end


end
