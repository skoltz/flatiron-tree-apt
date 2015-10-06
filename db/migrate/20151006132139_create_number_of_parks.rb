class CreateNumberOfParks < ActiveRecord::Migration
  def change
    create_table :number_of_parks do |t|

      t.timestamps null: false
    end
  end
end
