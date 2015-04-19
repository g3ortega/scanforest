class ChangeAlertDescriptionType < ActiveRecord::Migration
  def self.up
    change_table :alerts do |t|
      t.change :description, :string
    end
  end
  def self.down
    change_table :alerts do |t|
      t.change :description, :hstore
    end
  end
end
