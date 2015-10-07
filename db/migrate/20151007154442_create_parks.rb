class CreateParks < ActiveRecord::Migration
  def change
    create_table :parks do |t|
      t.string :park
      t.decimal :longitude
      t.decimal :latitude

      t.timestamps null: false
    end
  end
end
