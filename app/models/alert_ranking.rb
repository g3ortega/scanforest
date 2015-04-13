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

class AlertRanking < ActiveRecord::Base
  validates :user_id, :alert_id, presence: true
  validates_inclusion_of :ranking, :in => [true, false]
  validates_uniqueness_of :user_id, :scope => :alert_id
  belongs_to :user
  belongs_to :alert
end
