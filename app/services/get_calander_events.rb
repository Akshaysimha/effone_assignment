class GetCalanderEvents
  def initializer
  end

  def fetch_data
    response  = HTTParty.get('https://www.trumba.com/calendars/smithsonian-events.xml').body
    @hash = Hash.from_xml(response)
    @hash["feed"]["entry"].each do |h|
      event = Event.create(event_id: h['id'], title: h["title"], event_date: h["when"]["startTime"], 
        category: h["categories"], place: h["where"]["valueString"], venue: h["venue"],
        cost: h["cost"], details: h["content"])
    end
  end
end