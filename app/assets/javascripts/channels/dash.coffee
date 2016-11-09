App.activity = App.cable.subscriptions.create "DashChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (event) ->
    # Called when there's incoming data on the websocket for this channel
    $('#notifications').prepend "#{event.message}"
