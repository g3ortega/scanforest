# == Schema Information
#
# Table name: alerts
#
#  id          :integer          not null, primary key
#  lat         :float
#  lon         :float
#  magnitude   :integer
#  description :string
#  area        :float
#  created     :time
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  country_id  :integer
#  alert_type  :string
#

class AlertSerializer < ActiveModel::Serializer
  attributes :id, :lat, :lon, :magnitude, :description, :area, :created, :created_at, :updated_at
  has_many :alert_images
end
