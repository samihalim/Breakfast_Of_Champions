class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = current_user.notifications.unread
  end

  def destroy_notifications
    notifications.destroy_all
  end

end
