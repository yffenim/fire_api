class UsersController < ApiController
  # before_action :authenticate_user!
  before_action :set_user, only: [:show, :update, :destroy]
  
  # GET /users
  def index
    # @user = current_user
    @user = User.first # id 2
    render json: @user
    # @alerts_stats = avg_and_count(Alert.all, Alert.first.title) if Alert.count > 0
    # @seconds_stats = avg_and_count(Second.all, Second.first.title) if Second.count > 0
    # @thirds_stats = avg_and_count(Third.all, Third.first.title) if Third.count > 0
    # render json: [@user, @alerts_stats, @seconds_stats, @thirds_stats]
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
      params.require(:user).permit(:first_name, :last_name, :email, :fire_dept, :fire_station)
    end

    def avg_and_count(model_objects, title)
      levels = []
      model_objects.each { | a | levels << a.level }
      avg = levels.inject(0, :+) / model_objects.count
      @avg_and_count = { "title": title, "average": avg, "count": model_objects.count }
    end

end
