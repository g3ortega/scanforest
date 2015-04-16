class RenameAlertType < ActiveRecord::Migration
  def change
    rename_column :alerts, :type, :alert_type
  end
end
