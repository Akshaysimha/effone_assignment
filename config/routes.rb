Rails.application.routes.draw do
  resources :calender_events

  get "/update_events", :to => 'calender_events#update_events', :as => 'update_events'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
