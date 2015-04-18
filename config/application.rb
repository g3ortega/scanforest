require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Scanforest
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.to_prepare do
      DeviseController.respond_to :json
    end
    
    Twilio.configure do |config|
      config.account_sid = 'account_sid'
      config.auth_token = 'auth_token'
    end

    config.action_mailer.smtp_settings = {
        :address   => "smtp.mandrillapp.com",
        :port      => 587,
        :enable_starttls_auto => true,
        :user_name => Rails.application.secrets.mandrill_email,
        :password  => Rails.application.secrets.mandrill_password,
        :authentication => 'login',
        :domain => 'nuhome.com.ni',
    }

  end
end
