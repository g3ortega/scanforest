class CreateAlerts < ActiveRecord::Migration
  def change
    enable_extension :hstore
    create_table :alerts do |t|
      t.float :lat
      t.float :lon
      t.integer :magnitude
      t.hstore :description
      t.float :area
      t.time :created

      t.timestamps null: false
    end
  end
end
