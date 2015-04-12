# == Schema Information
#
# Table name: alert_images
#
#  id              :integer          not null, primary key
#  alert_id        :integer
#  image_file_name :string
#  image_file_size :float
#  path_image      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class AlertImage < ActiveRecord::Base
  belongs_to :alert
  has_attached_file :uploaded_image
  validates_attachment_content_type :uploaded_image,
    content_type: [ "image/jpg", "image/jpeg", "image/png", "image/gif"]
end
