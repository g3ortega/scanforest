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

require 'test_helper'

class AlertImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
