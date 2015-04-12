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

require 'test_helper'

class AlertImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
