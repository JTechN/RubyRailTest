class EventLogController < ApplicationController
  def index
    @event_logs = EventLog.all.order(created_at: :desc)
  end
end
