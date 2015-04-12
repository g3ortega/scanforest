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
#

class User < ActiveRecord::Base
  before_create :generate_auth_token!, :set_role
  validates :auth_token, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :alert_rankings

  has_many :alert_images

  def generate_auth_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

  def admin?
    self.role == "admin"
  end

  def technician?
    self.role == "technician"
  end

  def regular?
    self.role == "regular"
  end

  def guest?
    self.role == "guest" || self.role.nil?
  end

  protected

  def set_role
    self.role = "regular" if self.role.nil?
  end

end
