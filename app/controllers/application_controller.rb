class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_notifications, if: :current_user

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :bio, :username, :avatar_url, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :bio, :username, :avatar_url, :photo])
  end

  private

  def set_notifications
   notifications = Notification.where(recipient: current_user).newest_first.limit(9)
   @unread = notifications.unread
   @read = notifications.read
  end
end
