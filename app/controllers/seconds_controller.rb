class SecondsController < ApiController
  before_action :set_second, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /seconds
  def index
    seconds = current_user.seconds
    default = seconds.first
    seconds_total = seconds.count - 1     

    if seconds_total > 0
      ordered  = seconds.sort_by { |h| h["updated_at"] }.reverse!
      user_seconds = ordered[0...seconds_total]
      user_seconds = format_for_api(user_seconds)

      seconds_avg = get_avg(user_seconds, seconds_total)
      model_info = format_info(seconds_total, seconds_avg, default)
      render json: [model_info, user_seconds]
    else
      render json: no_user_data
    end
  end

  # GET /seconds/1
  def show
    render json: @second
  end

  # POST /seconds
  def create
    # title = Second.first.title
    @second = Second.new(second_params)
    # @second.title = title
    if @second.save
      render json: @second, status: :created, location: @second
    else
      render json: @second.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /seconds/1
  def update
    # update all object titles if relevant
    params_title = second_params["title"]
    if params_title != nil
      Second.update_all(:title => params_title)
    end

    if @second.update(second_params)
      render json: @second
    else
      render json: @second.errors, status: :unprocessable_entity
    end
  end

  # DELETE /seconds/1
  def destroy
    @second.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_second
      @second = Second.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def second_params
      params.require(:second).permit(:user_id, :level, :title)
    end
end
