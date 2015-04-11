class CreateAlertRankings < ActiveRecord::Migration
  def change
    create_table :alert_rankings do |t|
      t.integer :user_id
      t.integer :alert_id
      t.boolean :ranking

      t.timestamps null: false
    end
  end
end
