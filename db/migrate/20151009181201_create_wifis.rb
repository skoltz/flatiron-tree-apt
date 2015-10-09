class CreateWifis < ActiveRecord::Migration
  def change
    create_table :wifis do |t|
      t.string :boro
      t.string :wifi_type
      t.string :provider
      t.text :name
      t.float :latitude
      t.float :longitude
      t.string :location_t
      t.string :city
      t.string :ssid

      t.timestamps null: false
    end
  end
end
