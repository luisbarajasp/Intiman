# class ANotifications
#     constructor: ->
#         @notifications = $("[data-behavior='a_notifications']")
#         @setup() if @notifications.length
#
#     setup: ->
#         $.ajax(
#             url: "a_notifications.json"
#             dataType: "JSON"
#             method: "GET"
#             success: @handleSuccess
#         )
#
#     handleSuccess: (data) ->
#         items = $.map data, (notification) ->
#             "<li><a id='#{notification.id}' href='#{notification.url}' data-behavior='unread-link'>#{notification.message}</a></li>"
#
#         $("[data-behavior='unread-count']").text(items.length)
#         $("[data-behavior='notification-items']").html(items)
#
#         if items.length == 0
#             $("[data-behavior='unread-count']").text(0)
#             $("[data-behavior='notification-items']").html("<li>No tienes ninguna notificación</li>")
#
# jQuery ->
#     new ANotifications
