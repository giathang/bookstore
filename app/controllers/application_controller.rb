class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session

  attr_reader :current_user



  private

  # Get header
  def http_token
    @http_token ||= if request.headers['Authorization'].present?
                      request.headers['Authorization'].slipt(' ').last
                    end
  end

  # Get payload
  def auth_token
    @auth_token ||= JsonWebToken.decode(http_token)
  end

  # Get signature
  def user_id_in_token?
    http_token && auth_token && auth_token[:user_id].to_i
  end
end
