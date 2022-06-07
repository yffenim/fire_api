class UsersController < ApiController
  # before_action :authenticate_user!
  before_action :set_user, only: [:show, :update, :destroy]
  
  # GET /users
  def index
    # user = current_user
    # user = User.second
    user = User.first
    # puts "TOTAL COUNT FOR USER FIRST: #{user.seconds.count}***********"
    if user.seconds.count > 0       
      # puts "data exists**************"
      seconds_title = user.seconds.first.title
      seconds_id = user.seconds.first.id
      thirds_title = user.thirds.first.title
      thirds_id = user.thirds.first.id
      user.last_sign_in_at != nil ? signed_in = true : signed_in = false 
    else
      # puts "data does not exist*************"
      seconds_title = "Please add a title"
      seconds_id = 0
      thirds_title = "Please add a title"
      thirds_id = 0
      signed_in = false
    end
    user_info = { 
      "has_signed_in": signed_in,
      "secondsTitle": seconds_title,
      "thirdsTitle": thirds_title,
      "secondsId": seconds_id,
      "thirdsId": thirds_id
    }
    render json: [ user, user_info ]
  end

  # GET /users/1
  def show
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password)
    end

    def avg_and_count(model_objects, title)
      levels = []
      model_objects.each { | a | levels << a.level }
      avg = levels.inject(0, :+) / model_objects.count
      @avg_and_count = { "title": title, "average": avg, "count": model_objects.count }
    end

end
