class DashboardsController < ApplicationController
  def dashboard
    @streak = current_user.streak(:play_sessions)
  end

  private

  def set_redis_streak_counter
  end
end
