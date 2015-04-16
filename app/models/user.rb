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

class User < ActiveRecord::Base
  before_create :generate_auth_token!, :set_role
  validates :auth_token, uniqueness: true
  validates :role, presence: true,  inclusion: { in: %w(admin technician regular), message: "Invalid user role name" }
  validates :first_name, :last_name, presence: true, length: { maximum: 100,
                                                  too_long: "%{count} characters is the maximum allowed" }

  attr_accessor :user_type

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :alerts

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
  
  scope :technicians_messages, -> {
    where(:role => 'technician').where(:message => true)
  }

  def self.find_for_omniauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.info.email).first

      if registered_user
        return registered_user
      else
        user = User.create!(
            first_name: auth.info.first_name,
            last_name: auth.info.last_name,
            provider:auth.provider,
            uid:auth.uid,
            email:auth.info.email,
            config: { token: auth.credentials.token,
                                expires_at: auth.expires_at },
            role:'regular',
            password: Devise.friendly_token[0,20]
        )
      end

    end
  end

  protected

  def set_role
    self.role ||= "regular"
  end

end
