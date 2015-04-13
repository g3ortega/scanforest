class AddUniqueRestrictionToAlertRanking < ActiveRecord::Migration
  def change
    add_index :alert_rankings, [:user_id,:alert_id], unique: true
  end
end
