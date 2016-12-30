require 'rails_helper'

RSpec.describe CalenderEventsController, type: :controller do

  let(:event){FactoryGirl.create(:event)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:events)).to include(event)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, params: { id: event.id }
      expect(assigns(:event)).to eq(event)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #update_events" do
    it "returns http success" do
      expect { get :update_events, xhr: true }.to change { Event.count }.by_at_least(1)
    end
  end

end
