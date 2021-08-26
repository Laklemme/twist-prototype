class PlaySessionsController < ApplicationController
  before_action :set_play_session, only: :reward

  def create
    # @play_session = PlaySession.new
    # @play_session.user = current_user
    # @play_session.game = params[:game_id]
  end

  def show; end

  def update; end

  def options; end

  def reward
    @balance = PlaySession.find(params[:user_id])

    @balance += 1 if @play_session.completed
  end

  private

  def set_play_session
    @play_session = PlaySession.find(:id)
  end
end
