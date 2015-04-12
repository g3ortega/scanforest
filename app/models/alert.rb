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

require 'twilio-ruby'

class Alert < ActiveRecord::Base
  belongs_to :user
  belongs_to :country
  has_many :alert_rankings
  has_many :alert_images

  after_create :send_messages_to_technicians
  
  protected
  def send_messages_to_technicians
      client = Twilio::REST::Client.new
      User.technicians_messages.each do |user|
          client.messages.create({
	        :from => 'tuilio_number', 
	        :to => user.cell_phone, 
	        :body => 'A new alert was created',  
            })
      end
  end
  
end
