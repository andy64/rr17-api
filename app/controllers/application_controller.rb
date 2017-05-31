class ApplicationController < ActionController::API
  include ControllerHelper
  def render_error (inst_var)
    render json: format_error(inst_var.errors), status: 400, response_code: 400
  end
end
