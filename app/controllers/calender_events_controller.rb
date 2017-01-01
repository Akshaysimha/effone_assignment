class CalenderEventsController < ApplicationController
  def index
    @events = Event.all.sort_by &:event_date
  end

  def show
    @event = Event.find(params[:id])
  end

  def update_events
    @hash = Hash.from_xml(HTTParty.get('https://www.trumba.com/calendars/smithsonian-events.xml').body)
    @hash["feed"]["entry"].each do |h|
      event = Event.create(title: h["title"], event_date: h["when"]["startTime"], 
        category: h["categories"], place: h["where"]["valueString"], venue: h["venue"],
        cost: h["cost"], details: h["content"])
    end
    @events = Event.all.sort_by &:event_date
  end
end
