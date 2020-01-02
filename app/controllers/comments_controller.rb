class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_station, only: [:new, :create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to "/stations/#{@comment.station_id}", notice: 'レビューが投稿されました' }

      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  private
  def set_station
    @station = Station.find(params[:station_id])
  end

  def comment_params
    params.require(:comment).permit(:rate, :content, :category_id).merge(station_id: params[:station_id], user_id: current_user.id)
  end

end