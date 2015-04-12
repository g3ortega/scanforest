# == Schema Information
#
# Table name: alerts
#
#  id          :integer          not null, primary key
#  lat         :float
#  lon         :float
#  magnitude   :integer
#  description :hstore
#  area        :float
#  created     :time
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  country_id  :integer
#

class AlertSerializer < ActiveModel::Serializer
  attributes :id, :lat, :lon, :magnitude, :description, :area, :created, :created_at, :updated_at

end
