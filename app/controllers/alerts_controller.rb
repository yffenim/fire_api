class AlertsController < ApiController
  # require 'pry-byebug'
  before_action :set_alert, only: %i[ show update destroy] 
  # binding.pry
  # before_action :authenticate_user!
  
  # GET /alerts
  def index
    @alerts = Alert.all.order("updated_at DESC").first(5)
    @alerts_stats = set_avg_and_count(Alert.all) if @alerts.count > 0
    
    @seconds = Second.all.order("updated_at DESC").first(5)
    @seconds_stats = set_avg_and_count(Second.all) if @seconds.count > 0
    
    @thirds = Third.all.order("updated_at DESC").first(5)
    @thirds_stats = set_avg_and_count(Third.all) if @thirds.count > 0

    render json: [@alerts, @alerts_stats, @seconds, @seconds_stats, @thirds, @thirds_stars]
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
  
    # def set_avg_and_count(alerts)
    #   alert_levels = []
    #   alerts.each { | a | alert_levels << a.level }
    #   avg = alert_levels.inject(0, :+) / alerts.count
    #   @avg_and_count = { "average": avg, "count": alerts.count }
    # end 

    def set_avg_and_count(model_objects)
      levels = []
      model_objects.each { | a | levels << a.level }
      avg = levels.inject(0, :+) / model_objects.count
      @avg_and_count = { "average": avg, "count": model_objects.count }
    end 

end
