class AddReceiveMessageToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cell_phone, :string
    add_column :users, :message, :boolean, default: false
  end
end
