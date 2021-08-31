class GamesController < ApplicationController
  before_action :set_game, only: :show

  def index
    @games = Game.all
    @random_game = Game.order('random()').first
    @bg_colors = %w[green yellow red]
  end

  def show; end

  private

  def set_game
    @game = Game.find(params[:id])
  end
end
