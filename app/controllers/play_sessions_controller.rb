class PlaySessionsController < ApplicationController
  before_action :set_play_session, only: :show

  def create
    @play_session = PlaySession.new
    @play_session.user = current_user
    @play_session.game = Game.find(params[:game_id])
    @play_session.save
    # if @play_session.save
    #   flash[:notice] = ''
    # end
    redirect_to play_session_path(@play_session)
  end

  def show; end

  def update; end

  def options
    count_hash = JSON.parse($redis.get("user_id[#{current_user.id}]"))
    $redis.set("user_id[#{current_user.id}]", { coins: count_hash.nil? ? 0 :  count_hash["coins"] + 1 }.to_json, ex: 30)
    @counter = count_hash["coins"]
  end

  def reward
    @counter = $redis.get("user_id[#{current_user.id}]"["coins"])
    raise
  end

  private

  def set_play_session
    @play_session = PlaySession.find(params[:id])
  end
end
