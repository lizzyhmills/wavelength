class NotificationsController < ApplicationController
  def index
    # if current_user
    #   @notifications = current_user.notifications.reverse
    #   current_user.notifications.mark_as_read!
    # end
    @notifications = current_user.notifications
  end
end
