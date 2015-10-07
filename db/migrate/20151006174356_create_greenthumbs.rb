class CreateGreenthumbs < ActiveRecord::Migration
  def change
    create_table :greenthumbs do |t|
      t.text :garden_name
      t.text :address
      t.decimal :size, :precision => 3, :scale => 3
      t.decimal :longitude
      t.decimal :latitude
    end
  end
end
