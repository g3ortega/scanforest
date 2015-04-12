class AddCountryIdToAlerts < ActiveRecord::Migration
  def change
    add_column :alerts, :country_id, :integer
  end
end
