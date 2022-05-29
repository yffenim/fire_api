class ApiController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  # protect_from_forgery unless: -> { request.format.json? }
  # before_action :authenticate_user!
  # skip_before_action :verify_authenticity_token // this doesn't work bc the :verify_authenticity_token is inherited from base

  
    def get_avg(objects, count)
      levels = []
      objects.each { |obj| levels << obj.level }
      levels = levels.compact
      avg = levels.inject(0, :+) / count
    end

    def format_info(total, avg, default)
      info = { "count": total, "avg": avg, "first_obj": default }
    end

    def no_data
      msg = "data object does not exist"
      first_obj = { 
        id: 0, 
        user_id: 0, 
        level: 0, 
        created_at: msg,
        updated_at: msg 
      }
      info = { "count": 0, "avg": 0, "first_obj": first_obj }
      json = [ info, [] ]
    end

end

