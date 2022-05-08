class ThirdsController < ApplicationController
  before_action :set_third, only: [:show, :update, :destroy]

  # GET /thirds
  def index
    # @thirds = Third.all
    @thirds = current_user.alerts.all.order("updated_at DESC")

    render json: @thirds
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
