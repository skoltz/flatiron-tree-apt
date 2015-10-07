class CreateParks < ActiveRecord::Migration
  def change
    create_table :parks do |t|
      t.string :park
      t.decimal :longitude, precision: 10, scale: 6
      t.decimal :latitude, precision: 10, scale: 6

      t.timestamps null: false
    end
  end
end