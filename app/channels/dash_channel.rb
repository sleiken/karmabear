class DashChannel < ApplicationCable::Channel
  def subscribed
    stream_for $current_manager
    # stream_from "dash_channel:#{$current_manager[:id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  private

  def authorize_subscriber

  end
end
