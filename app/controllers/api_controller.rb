class ApiController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  # protect_from_forgery unless: -> { request.format.json? }
  # before_action :authenticate_user!
  # skip_before_action :verify_authenticity_token // this doesn't work bc the :verify_authenticity_token is inherited from base

    def avg_and_count(model_objects)
      p "objects: #{model_objects}"
      levels = []
      model_objects.each { | a | levels << a.level }
      levels = levels.compact
      avg = levels.inject(0, :+) / model_objects.count
      @avg_and_count = { "average": avg, "count": model_objects.count }
    end
end

