class EventBroadcastJob < ApplicationJob
  queue_as :default

  def perform(event)
    ActionCable.server.broadcast 'dash_channel', message: render_event(event)
  end

  private

  def render_event(event)
    ApplicationController.renderer.render(partial: 'notifications/event', locals: { event: event })
  end
end
