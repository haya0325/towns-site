class StationsController < ApplicationController
  before_action :set_station, only: :show

  # GET /stations
  # GET /stations.json
  def index
    @stations = Station.all
    @traffic_station_ids = Comment.get_station_ids(1)
    @traffic_ranking = @traffic_station_ids.map { |id| Station.find(id) }
    @commercial_station_ids = Comment.get_station_ids(2)
    @commercial_ranking = @commercial_station_ids.map { |id| Station.find(id) }
    @entertainment_station_ids = Comment.get_station_ids(3)
    @entertainment_ranking = @entertainment_station_ids.map { |id| Station.find(id) }
    @security_station_ids = Comment.get_station_ids(4)
    @security_ranking = @security_station_ids.map { |id| Station.find(id) }
    @nature_station_ids = Comment.get_station_ids(5)
    @nature_ranking = @nature_station_ids.map { |id| Station.find(id) }
    @all_ranking = [@traffic_ranking, @commercial_ranking, @entertainment_ranking, @security_ranking, @nature_ranking]
  end

  # GET /stations/1
  # GET /stations/1.json
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
end

def ranking
  product_ids = Review.group(:product_id).order('count_product_id DESC').limit(5).count(:product_id).keys
  @ranking = product_ids.map { |id| Product.find(id) }
end

