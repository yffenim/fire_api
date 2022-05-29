class SecondsController < ApiController
  before_action :set_second, only: [:show, :update, :destroy]

  # GET /seconds
  def index
    @seconds_total = Second.all.count - 1

    if @seconds_total > 0
      @default_second = Second.all.order if @seconds_total > 0
      @user_seconds = Second.all.order("updated_at DESC")[1...@seconds_total]
      @seconds_avg = get_avg(@user_seconds, @seconds_total)
      @model_info = format_info(@seconds_total, @seconds_avg, @default_second)
      render json: [@model_info, @user_seconds]
    else 
      render json: no_data
    end

  end

  # GET /seconds/1
  def show
    render json: @second
  end

  # POST /seconds
  def create
    @second = Second.new(second_params)

    if @second.save
      render json: @second, status: :created, location: @second
    else
      render json: @second.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /seconds/1
  def update
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
