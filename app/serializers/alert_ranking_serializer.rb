# == Schema Information
#
# Table name: alert_rankings
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  alert_id   :integer
#  ranking    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AlertRankingSerializer < ActiveModel::Serializer
  attributes :id, :ranking, :created_at, :updated_at

  # belongs_to :user
  # belongs_to :alert
end
