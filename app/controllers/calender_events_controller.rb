class CalenderEventsController < ApplicationController

  before_filter :get_all_events, only: [:index, :update_events]
  
  def index
  end

  def show
    @event = Event.find(params[:id])
  end

  def update_events
    GetCalanderEvents.new().fetch_data
  end

  private

  def get_all_events
    @events = Event.all.sort_by &:event_date
  end
end
