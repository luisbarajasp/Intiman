json.array! @notifications do |notification|
    json.message notification.message
    json.url order_path(notification.order)
end
