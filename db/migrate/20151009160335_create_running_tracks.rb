class CreateRunningTracks < ActiveRecord::Migration
  def change
    create_table :running_tracks do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.text :address
      t.text :location
      t.float :size

      t.timestamps null: false
    end
  end
end
