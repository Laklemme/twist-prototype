class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :logged_in_user, only: :home

  def home; end

  private

  # Private methods for checking if a user is
  # already logged in when visiting the page
  #
  # if user is already logged in redirect to games#index
  def logged_in?
    !current_user.nil?
  end

  # Confirms a logged-in user.
  def logged_in_user
    redirect_to games_path if logged_in?
  end
end
