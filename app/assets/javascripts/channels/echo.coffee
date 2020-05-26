App.echo = App.cable.subscriptions.create "EchoChannel",
  connected: ->
  	console.log 'Welcome to websocket client side'
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log 'App.echo', 'received', data
    # Called when there's incoming data on the websocket for this channel
    # Data can be sent using `App.echo.send({ data: 'some data' })`
