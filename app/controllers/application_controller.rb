class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? }
  skip_before_action :verify_authenticity_token
  # protect_from_forgery with: :null_session

end
