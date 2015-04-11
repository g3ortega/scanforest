class CreateAlertImages < ActiveRecord::Migration
  def change
    create_table :alert_images do |t|
      t.references :alert, index: true
      t.string :image_file_name
      t.float :image_file_size
      t.string :path_image

      t.timestamps null: false
    end
    add_foreign_key :alert_images, :alerts
  end
end
