class GamesController < ApplicationController
  # maybe remove later ?
  skip_before_action :authenticate_user!, only: :index

  def index
    @games = Game.all
  end
end
