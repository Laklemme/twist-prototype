class DashboardsController < ApplicationController
  def dashboard
    @users = User.all
    @users = @users.sort {|a,b| a.balance <=> b.balance}.reverse
  end
end
