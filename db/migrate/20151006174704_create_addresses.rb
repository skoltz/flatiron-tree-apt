class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :address
      t.timestamps null: false
    end
  end
end
