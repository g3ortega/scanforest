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
#

require 'twilio-ruby'

class Alert < ActiveRecord::Base
  has_many :alert_rankings
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
