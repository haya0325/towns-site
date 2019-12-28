class StationsController < ApplicationController
  before_action :set_station, only: :show

  def index
    @stations = Station.all
    @traffic_ranking = ranking(1)
    @commercial_ranking = ranking(2)
    @entertainment_ranking = ranking(3)
    @security_ranking = ranking(4)
    @nature_ranking = ranking(5)
  end

  def show
    @categories = Category.all
    @each_rate_sum = @station.comments.group(:category_id).sum(:rate)
    @each_comments_number = @station.comments.group(:category_id).count
  end

  def search
    @station = Station.find_by(name: params[:word])
    if @station.present?
      redirect_to "/stations/#{@station.id}"
    else
      redirect_to "/", notice: '見つかりませんでした'
    end
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

  def ranking(category_id)
    hash = {}
    @stations.each do |station|
      rate_sum = Comment.where(station_id: station.id, category_id: category_id).sum(:rate)
      count = Comment.where(station_id: station.id, category_id: category_id).count
      if count != 0
        rate_average = (rate_sum/count.to_f).round(1)
      else
        rate_average = 0
      end
      hash.store(station.id, rate_average)
    end
    ranking_array = hash.sort_by{ | k ,v | v }.reverse
    station_id_ranking = []
    ranking_array.each do |inner_array|
      station_id_ranking << inner_array[0]
    end
    station_ranking = station_id_ranking.map{ |id| Station.find(id)}
    return station_ranking
  end
end
