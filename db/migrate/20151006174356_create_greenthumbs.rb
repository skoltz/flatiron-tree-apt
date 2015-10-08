class CreateGreenthumbs < ActiveRecord::Migration
  def change
    create_table :greenthumbs do |t|
      t.text :garden_name
      t.text :address
      t.text :boro
      t.decimal :size, :precision => 3, :scale => 3
      t.float :longitude
      t.float :latitude
    end
  end
end
