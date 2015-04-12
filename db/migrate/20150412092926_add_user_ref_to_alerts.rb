class AddUserRefToAlerts < ActiveRecord::Migration
  def change
    add_reference :alerts, :user, index: true
    add_foreign_key :alerts, :users
  end
end
