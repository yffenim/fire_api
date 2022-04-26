class AlertsController < ApiController
  require 'pry-byebug'
  before_action :set_alert, only: %i[ show update destroy] 
  # binding.pry
  # before_action :authenticate_user!
  
  # GET /alerts
  def index
    @alerts = Alert.all.order("updated_at DESC").last(10)
    @seconds = Second.all.order("updated_at DESC").last(10)
    @thirds = Third.all.order("updated_at DESC").last(10)

    render json: [@alerts, @alerts.count, @seconds, @seconds.count, @thirds, @thirds.count]

    # @time = Alert.first.updated_at.inspect

    # binding.pry
    # render json: @time
  end

  # GET /alerts/1
  def show
    render json: @alert
  end

  # POST /alerts
  def create
    @alert = Alert.new(alert_params)

    if @alert.save
      render json: @alert, status: :created, location: @alert
    else
      render json: @alert.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /alerts/1
  def update
    if @alert.update(alert_params)
      render json: @alert
    else
      render json: @alert.errors, status: :unprocessable_entity
    end
  end

  # DELETE /alerts/1
  def destroy
    @alert.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alert
      @alert = Alert.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def alert_params
      params.require(:alert).permit(:user_id, :level)
    end
  

end
