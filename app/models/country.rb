# == Schema Information
#
# Table name: countries
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  iso         :string
#

class Country < ActiveRecord::Base
  validates :name, presence: true
  has_many :alerts
end
