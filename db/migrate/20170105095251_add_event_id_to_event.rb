class AddEventIdToEvent < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :event_id, :string
  end
end
