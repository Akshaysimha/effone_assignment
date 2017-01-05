require 'rails_helper'

RSpec.describe GetCalanderEvents do
  describe "save event fetching form api" do
    it "fetch data from api and sva in database" do
      response = File.open('sample_response.xml')
      stub_request(:get, 'https://www.trumba.com/calendars/smithsonian-events.xml').to_return(:body => response, :status => 200, :headers => {})
      GetCalanderEvents.new().fetch_data
      expect(Event.last.title).to eq('Test Title 2')
    end    
  end
end
