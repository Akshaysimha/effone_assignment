class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :event_date
      t.string :category
      t.string :place
      t.string :venue
      t.string :cost
      t.text :details

      t.timestamps
    end
  end
end
