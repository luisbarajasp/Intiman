json.array! @notifications do |notification|
    json.id notification.id
    json.message notification.message
    json.url order_path(notification.order)
end
