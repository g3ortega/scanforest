class UseAttachmentForImages < ActiveRecord::Migration
  def change
    change_table :alert_images do |t|
      t.attachment :uploaded_image
    end
    remove_column :alert_images, :image_file_name
    remove_column :alert_images, :image_file_size
    remove_column :alert_images, :path_image
  end
end
