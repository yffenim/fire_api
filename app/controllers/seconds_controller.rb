class SecondsController < ApplicationController
  before_action :set_second, only: [:show, :update, :destroy]

  # GET /seconds
  def index
    @seconds = Second.all.order("updated_at DESC")
    # @seconds = current_user.seconds.all.order("updated_at DESC")
    render json: @seconds
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
