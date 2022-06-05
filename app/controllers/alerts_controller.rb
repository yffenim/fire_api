class AlertsController < ApiController
  before_action :authenticate_user!
  before_action :set_alert, only: %i[ show update destroy] 
  # require 'pry-byebug'

  # GET /alerts
  def index
    # the first alert is a system default and does not belong to the user
    # this is true for all models
    alerts_count = Alert.all.count
    alerts_total = get_total(Alert) # total amount minus the system default
    default_id = 1 
    default_alert = Alert.find(default_id)
    user_alerts = []

    if alerts_total > 0
      Alert.all.order("updated_at DESC").each do |entry| 
        user_alerts << entry if entry.id != default_id
      end

      alerts_avg = get_avg(user_alerts, alerts_total)
      model_info = format_info(alerts_total, alerts_avg, default_alert)
      render json: [model_info, user_alerts]
    else
      render json: no_user_data
    end

  end

  # GET /alerts/1
  def show
    render json: @alert
  end

# if we are changing the title attribute, please update all attributes
  # POST /alerts
  def create
    @alert = Alert.new(alert_params)
    @alert.title = "alertness"
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
