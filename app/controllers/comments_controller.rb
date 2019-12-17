class CommentsController < ApplicationController
  before_action :authenticate_user!, only: :new
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :set_station, only: [:new, :create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to "/stations/#{@comment.station_id}", notice: 'レビューが投稿されました' }
        # format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_station
    @station = Station.find(params[:station_id])
  end

  def comment_params
    params.require(:comment).permit(:rate, :content, :category_id).merge(station_id: params[:station_id], user_id: current_user.id)
  end

  # def integer_string?(str)
  #   Integer(str)
  #   true
  # rescue ArgumentError
  #   false
  # end

  # def params_int(model_params)
  #   model_params.each do |key,value|
  #     if integer_string?(value)
  #       model_params[key]=value.to_i
  #     end
  #   end
  # end

end