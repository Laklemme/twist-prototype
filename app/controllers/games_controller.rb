class GamesController < ApplicationController
  before_action :set_dino, only: :show

  def show; end

  private

  def set_game
    @game = Game.find(params[:id])
  end
end
