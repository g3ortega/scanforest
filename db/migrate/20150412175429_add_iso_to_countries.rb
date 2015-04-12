class AddIsoToCountries < ActiveRecord::Migration
  def change
    add_column :countries, :iso, :string
  end
end
