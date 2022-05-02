class ApiController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  # protect_from_forgery unless: -> { request.format.json? }
  # before_action :authenticate_user!
  # skip_before_action :verify_authenticity_token // this doesn't work bc the :verify_authenticity_token is inherited from base


end

