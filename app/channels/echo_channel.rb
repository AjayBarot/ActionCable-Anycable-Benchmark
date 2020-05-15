class EchoChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'echo'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    ActionCable.server.broadcast 'echo', data
  end
end
