class DashboardsController < ApplicationController
  def dashboard
    @streak = current_user.streak(:play_sessions)
    @games = Game.all
    @users = User.all
    @users = @users.sort {|a,b| a.balance <=> b.balance}.reverse
  end
end
