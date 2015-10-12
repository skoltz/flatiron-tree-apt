class CreateParks < ActiveRecord::Migration
  def change
    create_table :parks do |t|
      t.text :address
      t.string :park
      t.float :longitude
      t.float :latitude

      t.timestamps null: false
    end
  end
end