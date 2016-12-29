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
      get :show, id: event.id
      expect(assigns(:event)).to eq(event)
      expect(response).to have_http_status(:success)
    end
  end

end
