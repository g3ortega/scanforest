class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :config, :hstore
  end
end
