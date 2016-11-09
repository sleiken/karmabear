class DashChannel < ApplicationCable::Channel
  def subscribed
    stream_from "dash_channel_#{$current_manager[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
