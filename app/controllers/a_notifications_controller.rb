class ANotificationsController < ApplicationController
    before_action :authenticate_admin!

  def index
      @notifications = ANotification.unread
  end

  # def mark_as_read
  #     @notification = ANotification.find(params[:id])
  #     @notification.update_attribute(:read_at, Time.now.in_time_zone)
  # end
end
