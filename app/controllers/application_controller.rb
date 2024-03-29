class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  # add_flash_types :info, :notice, :alert

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname])
  end

  def default_url_options
    #  We generate the absolute url needed to load our images from the external world (Facebook, Twitter, ...).
    #  That's why we override Rails.application.default_url_options[:host] by adding the following:
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
