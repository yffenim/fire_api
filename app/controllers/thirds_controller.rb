class ThirdsController < ApiController
  before_action :set_third, only: [:show, :update, :destroy]
  require 'pry-byebug'

  # GET /thirds
  def index
    thirds_count = Third.all.count
    thirds_total = get_total(Third) 
    user_thirds = []
    default_id = 3
    default_third = Third.find(default_id)

    if thirds_total > 0
      Third.all.order("updated_at DESC").each do | entry |
        user_thirds << entry if entry.id != default_id
      end

      thirds_avg = get_avg(user_thirds, thirds_total)
      model_info = format_info(thirds_total, thirds_avg, default_third)

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
    @third = Third.new(third_params)
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
