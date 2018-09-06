Devise.setup do |config|
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.omniauth :facebook,
    Rails.application.credentials.facebook[:app_id],
    Rails.application.credentials.facebook[:app_secret],
    {scope: 'email public_profile', callbackURL: '/auth/facebook/callback'}
  config.omniauth :google,
    Rails.application.credentials.google[:app_id],
    Rails.application.credentials.google[:app_secret]
    
  config.omniauth :google_oauth2, 12345, 12345 #where the first value is the app id and the second the application secret.
end
