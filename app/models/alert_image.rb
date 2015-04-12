# == Schema Information
#
# Table name: alert_images
#
#  id                          :integer          not null, primary key
#  alert_id                    :integer
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  uploaded_image_file_name    :string
#  uploaded_image_content_type :string
#  uploaded_image_file_size    :integer
#  uploaded_image_updated_at   :datetime
#

class AlertImage < ActiveRecord::Base
  belongs_to :alert
  has_attached_file :uploaded_image
  validates_attachment_content_type :uploaded_image,
    content_type: [ "image/jpg", "image/jpeg", "image/png", "image/gif"]
end
