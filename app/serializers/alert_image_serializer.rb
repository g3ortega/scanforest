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

class AlertImageSerializer < ActiveModel::Serializer
  attributes :id, :image_file_name, :image_file_size, :path_image, :created_at, :updated_at
end
