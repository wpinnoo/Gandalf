class CreateClubEvents < ActiveRecord::Migration
  def change
    create_table :club_events do |t|
      t.references :club, index: true
      t.references :event, index: true

      t.timestamps
    end
  end
end
