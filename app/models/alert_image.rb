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

  validates :alert, presence: true

  before_create :decode_image_data
  has_attached_file :uploaded_image
  validates_attachment_content_type :uploaded_image,
    content_type: [ "image/jpg", "image/jpeg", "image/png", "image/gif"]
  attr_accessor :image_data, :image
    
  def decode_image_data
    if self.image_data.present?
      data = StringIO.new(Base64.decode64(self.image_data[:image_data]))
      data.class.class_eval {attr_accessor :original_filename, :content_type}
      data.original_filename = self.image_data[:file_name]
      data.content_type = self.image_data[:content_type]
      
      self.uploaded_image = data
    end
  end
end
