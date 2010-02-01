#ENV['RAILS_ENV'] ||= 'production'

RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.gem 'authlogic',
             :version => '~> 2.1.2'
  config.gem 'haml',
             :version => '~> 2.2.8'
  #config.gem 'resource_controller',
  #           :version => '~> 0.5.3'          
  config.gem "mislav-will_paginate", :lib => "will_paginate", :source => "http://gems.github.com"
  config.gem 'thoughtbot-paperclip', :lib => 'paperclip', :source => 'http://gems.github.com'
  config.gem 'thinking-sphinx', :lib     => 'thinking_sphinx', :version => '1.3.15'

  config.active_record.default_timezone = :utc
  
  config.i18n.load_path = Dir[File.join(RAILS_ROOT, 'config', 'locales', '*.{rb,yml}')]
  config.i18n.default_locale = :cz
  
  config.action_controller.session_store = :active_record_store
  
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.default_charset = "utf-8"

end

 ActionMailer::Base.delivery_method = :smtp

 ActionMailer::Base.smtp_settings = {
   :address  => "smtp-out.xnet.cz",
   :port => 25,
   :domain => "autanasbavi.cz" 
 } 