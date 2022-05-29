class ApiController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  # protect_from_forgery unless: -> { request.format.json? }
  # before_action :authenticate_user!
  # skip_before_action :verify_authenticity_token // this doesn't work bc the :verify_authenticity_token is inherited from base


  def get_avg(objects, count)
    levels = []
    objects.each { |obj| levels << obj.level }
    levels = levels.compact
    # convert back to 1-9 scale bc that's what client sees
    levels = levels.map { |level| convert_to_1_to_9(level) }
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

  private
    def convert_to_1_to_9(level)
      scale = { 
        1.0 => 1.0, 
        2.0 => 1.5, 
        3.0 => 2.0,
        4.0 => 2.5,
        5.0 => 3.0,
        6.0 => 3.5,
        7.0 => 4.0,
        8.0 => 4.5,
        9.0 => 5.0
      }
      new_level = scale.key(level)
    end

end

