class CreateLatitudes < ActiveRecord::Migration
  def change
    create_table :latitudes do |t|

      t.timestamps null: false
    end
  end
end
