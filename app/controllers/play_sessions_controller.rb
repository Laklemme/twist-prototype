class PlaySessionsController < ApplicationController
  before_action :set_play_session, only: :show

  def create
    @play_session = PlaySession.new
    @play_session.user = current_user
    @play_session.game = Game.find(params[:game_id])
    # if @play_session.save
    #   flash[:notice] = ''
    # end
    redirect_to play_session_path(@play_session)
  end

  def show; end

  def update; end

  def options; end

  def reward; end

  private

  def set_play_session
    @play_session = PlaySession.find(params[:id])
  end
end
