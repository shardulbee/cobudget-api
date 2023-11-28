# typed: true

class ApplicationController < ActionController::API
  before_action :cors_set_access_control_headers

  def home
    render status: :ok, html: '<h1>Hello, from the app!</h1>'.html_safe
  end

  def cors_preflight_check
    if request.method == 'OPTIONS'
      cors_set_access_control_headers
      head :ok
    end
  end

  protected

  def cors_set_access_control_headers
    response.headers['Access-Control-Allow-Origin'] = '*'
    response.headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization'
    response.headers['Access-Control-Max-Age'] = '7200'
  end
end
