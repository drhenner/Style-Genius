Hadean::Application.configure do
  # Settings specified here will take precedence over those in config/environment.rb

  # Configure static asset server for tests with Cache-Control for performance
  config.serve_static_assets = true
  config.static_cache_control = "public, max-age=3600"

  # The test environment is used exclusively to run your application's
  # test suite.  You never need to work with it otherwise.  Remember that
  # your test database is "scratch space" for the test suite and is wiped
  # and recreated between test runs.  Don't rely on the data there!
  config.cache_classes = true

  # Log error messages when you accidentally call methods on nil.
  config.whiny_nils = true

  # Show full error reports and disable caching
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Raise exceptions instead of rendering exception templates
  config.action_dispatch.show_exceptions = false

  # Disable request forgery protection in test environment
  config.action_controller.allow_forgery_protection    = false

  # Tell Action Mailer not to deliver emails to the real world.
  # The :test delivery method accumulates sent emails in the
  # ActionMailer::Base.deliveries array.
  config.action_mailer.delivery_method = :test
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper,
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql

  # Print deprecation notices to the stderr
  config.active_support.deprecation = :stderr

  config.after_initialize do
    ActiveMerchant::Billing::Base.mode = :test
    ::GATEWAY = ActiveMerchant::Billing::BogusGateway.new

    ::CIM_GATEWAY = ActiveMerchant::Billing::AuthorizeNetCimGateway.new(
      :login    => HADEAN_CONFIG['authnet']['login'],
      :password => HADEAN_CONFIG['authnet']['password'],
      :test     => true
    )
  end
  PAPERCLIP_STORAGE_OPTS = {  :styles => {:mini => '48x48>',
                                          :small => '100x100>',
                                          :medium => '200x200>',
                                          :product => '320x320>',
                                          :large => '600x600>' },
                              :default_style => :product,
                              :url => "/assets/products/:id/:style/:basename.:extension",
                              :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension" }
  Mime::Type.register "application/pdf", :pdf
end
