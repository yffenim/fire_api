class ThirdsController < ApiController
  before_action :set_third, only: [:show, :update, :destroy]
  before_action :authenticate_user!
  # require 'pry-byebug'

  # GET /thirds
  def index
    thirds = current_user.thirds
    default = thirds.first
    thirds_total = thirds.count - 1 # will this throw an aerror

    if thirds_total > 0
      ordered  = thirds.sort_by { |h| h["updated_at"] }.reverse!
      user_thirds = ordered[0...thirds_total]
      user_thirds = format_for_api(user_thirds)

      thirds_avg = get_avg(user_thirds, thirds_total)
      model_info = format_info(thirds_total, thirds_avg, default)
      render json: [model_info, user_thirds]
    else
      render json: no_user_data
    end
  end

  # GET /thirds/1
  def show
    render json: @third
  end

  # POST /thirds
  def create
    # title = Third.first.title
    @third = Third.new(third_params)
    # @third.title = title
    if @third.save
      render json: @third, status: :created, location: @third
    else
      render json: @third.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /thirds/1
  def update
    # if the title exists and is different, update the title
    params_title = third_params["title"]
    if params_title != nil
      Third.update_all(:title => params_title)
    end
    
    if @third.update(third_params)
      render json: @third 
    else
      render json: @third.errors, status: :unprocessable_entity
    end
  end

  # DELETE /thirds/1
  def destroy
    @third.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_third
      @third = Third.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def third_params
      params.require(:third).permit(:user_id, :level, :title)
    end

end
