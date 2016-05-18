class UNotifications
    flag = false
    constructor: ->
        @notifications = $("[data-behavior='u_notifications']")
        @setup() if @notifications.length

    setup: ->
        $("[data-behavior='unread-link']").on "click", @handleClick
        $.ajax(
            url: "/u_notifications.json"
            dataType: "JSON"
            method: "GET"
            success: @handleSuccess
        )

    handleClick: ->
        if (flag)
            $("[data-behavior='notification-items']").html("<li>No tienes ninguna notificación</li>")
        else
            $.ajax(
                url: "/u_notifications/mark_as_read/"
                dataType: "JSON"
                method: "POST"
                success: ->
                    $("[data-behavior='unread-count']").text(0)

            )
            $("[data-behavior='unread-count']").text(0)
            flag = true

    handleSuccess: (data) ->
        items = $.map data, (notification) ->
            "<li><a id='#{notification.id}' href='#{notification.url}'>#{notification.message}</a></li>"

        $("[data-behavior='unread-count']").text(items.length)
        $("[data-behavior='notification-items']").html(items)

        if items.length == 0
            $("[data-behavior='unread-count']").text(0)
            $("[data-behavior='notification-items']").html("<li>No tienes ninguna notificación</li>")

jQuery ->
    new UNotifications
