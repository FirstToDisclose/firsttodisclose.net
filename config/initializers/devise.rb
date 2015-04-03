Devise.setup do |config|

  config.mailer_sender = 'info@firsttodisclose.net'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 8..128
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete
  config.omniauth :github, ENV['GITHUB_KEY'] || '64f0f24ed394a2f20496', ENV['GITHUB_SECRET'] || '665a1cd6e815afe20fb7b0a7b2783ae07580c983', scope: 'user,public_repo'
  config.omniauth :facebook, ENV['FB_ID'] || '858263664247424', ENV['FB_SECRET'] || '01cf8dc56ff90ad924b2a6c0e0b30d0d'
  config.omniauth :mit, ENV['MIT_ID'] || '000000000000000', ENV['MIT_SECRET'] || '0000000000000000'
  config.omniauth :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
end
