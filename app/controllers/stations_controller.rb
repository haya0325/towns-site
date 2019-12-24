class StationsController < ApplicationController
  before_action :set_station, only: :show

  # GET /stations
  # GET /stations.json
  def index
    @stations = Station.all
  end

  # GET /stations/1
  # GET /stations/1.json
  def show
    @categories = Category.all
    @each_rate_sum = @station.comments.group(:category_id).sum(:rate)
    @each_comments_number = @station.comments.group(:category_id).count
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_station
      @station = Station.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def station_params
      params.require(:station).permit(:name)
    end
end
