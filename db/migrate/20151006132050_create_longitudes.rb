class CreateLongitudes < ActiveRecord::Migration
  def change
    create_table :longitudes do |t|

      t.timestamps null: false
    end
  end
end
