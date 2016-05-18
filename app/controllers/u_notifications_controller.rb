class UNotificationsController < ApplicationController
    before_action :authenticate_user!

  def index
      @notifications = UNotification.where(user: current_user).unread
  end

  def mark_as_read
      @notifications = UNotification.where(user: current_user).unread
      @notifications.each do |notification|
          notification.update_attribute(:read_at, Time.now.in_time_zone)
      end
      render json: {success: true}
  end
end
