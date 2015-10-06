class CreateGreenthumbs < ActiveRecord::Migration
  def change
    create_table :greenthumbs do |t|
      t.text :address
      t.decimal :size
      t.decimal :longitude
      t.decimal :latitude

      t.timestamps null: false
    end
  end
end
