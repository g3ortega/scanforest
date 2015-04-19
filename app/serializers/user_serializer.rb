# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#  auth_token             :string
#  role                   :string
#  cell_phone             :string
#  message                :boolean          default(FALSE)
#  first_name             :string
#  last_name              :string
#  provider               :string
#  uid                    :string
#  config                 :hstore
#

class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :role, :created_at, :updated_at, :last_sign_in_at
  has_many :alerts
end
