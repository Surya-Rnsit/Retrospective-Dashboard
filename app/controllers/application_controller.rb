class ApplicationController < ActionController::Base
  before_action :set_locale

  # This to to prevent forgery protection system.
  # If you have controllers that are meant to be called by external parties you should disable forgery protection.
  skip_before_action :verify_authenticity_token
  add_flash_types :danger, :info, :warning, :success
  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end

