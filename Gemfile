source 'http://rubygems.org'

## Bundle rails:
gem 'rails', '~> 3.1.3'

group :assets do

  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end
  gem 'sass-rails', "  ~> 3.1.0"
# If you use compass:


gem "activemerchant", '~> 1.17.0'#, :lib => 'active_merchant'
gem 'authlogic', "3.0.3"
gem 'bluecloth',     '~> 2.1.0'
gem 'cancan', '~> 1.4.1'
#gem 'compass', "~> 0.11.5"
#gem 'compass', '~> 0.12.alpha.2'
gem 'compass', git: 'git://github.com/chriseppstein/compass', branch: 'master'
#gem 'compass', git: 'https://github.com/chriseppstein/compass.git', branch: 'rails31'
#  gem 'dalli', '~> 1.0.2'

gem "friendly_id", "~> 3.3"
gem 'haml',  ">= 3.0.13"#, ">= 3.0.4"#, "2.2.21"#,
gem "jquery-rails"

#gem 'memcache-client', '~> 1.8.5'
#gem 'mercury-rails', git: 'https://github.com/jejacks0n/mercury.git', ref: '38df02f55e55b1656581b893b14a6e3e006f9b78'

gem 'nested_set', '~> 1.6.3'
gem "nifty-generators", :git => 'git://github.com/drhenner/nifty-generators.git'
gem 'nokogiri', '~> 1.5.0'
gem 'paperclip', '~> 2.4.5'
gem 'prawn', '~> 0.12.0'

gem 'rails3-generators', '~> 0.17.0'
gem 'rmagick',    :require => 'RMagick'

gem 'rake', '= 0.9.2'
gem 'ssl_requirement'
gem 'state_machine', '~> 1.0.1'
gem 'survey_says', :git => 'git@github.com:drhenner/survey_says.git'
#gem 'sunspot_solr'
#gem 'sunspot_rails', '~> 1.3.0rc'
gem 'will_paginate', '~> 3.0.0'

## ADD stuff here if you need them
platforms :ruby_19 do
  gem "ruby-debug19", :group => [:test]
end
platforms :ruby_18 do
  gem "ruby-debug", :group => [:test]
end

group :development do
  #gem 'awesome_print'
  gem "autotest-rails-pure"

  gem "rails-erd"
  gem "ruby-debug19"
  # YARD AND REDCLOTH are for generating yardocs
  gem 'yard'
  gem 'RedCloth'
end
group :test, :development do
  gem 'mysql2', '~> 0.3.10'
  gem "rspec-rails", "~> 2.7.0"
  gem 'capybara', :git => 'git://github.com/jnicklas/capybara.git'
  gem 'launchy'
  gem 'database_cleaner'
end

group :test do
  gem 'factory_girl_rails', "~> 1.1.0"
  gem 'mocha', '~> 0.10.0', :require => false
  gem 'rspec-rails-mocha'
  gem "shoulda"
  gem "rspec",        "~> 2.7.0"

  gem "rspec-core",         "~> 2.7.1"
  gem "rspec-expectations", "~> 2.7.0"
  gem "rspec-mocks",        "~> 2.7.0"
  gem 'email_spec'

  gem "faker"
  gem "autotest", '~> 4.4.6'
  gem "autotest-rails-pure"

  if RUBY_PLATFORM =~ /darwin/
    gem "autotest-fsevent", '~> 0.2.5'
  end
  gem "autotest-growl"
  #gem "redgreen"
  #gem "test-unit", "1.2.3"
  gem "ZenTest", '4.5.0'# 4.6 breaks autotest

  ###  THESE ARE ALL FOR CUCUMBER
#  gem "webrat"  ## USE webrat or capybara NOT BOTH
#  gem "capybara"
#  gem "capybara-envjs"
#  gem "database_cleaner"
#  gem "cucumber"
#  gem "cucumber-rails"
#  gem 'spork'
#  gem "launchy"

end

group :production do
  gem  'pg'
end




## require 'riak-sessions'
#gem 'curb' # Faster HTTP
#gem 'yajl-ruby' # Faster JSON
#gem 'riak-client', :require => 'riak'
#gem 'ripple'
#gem 'riak-sessions'
#gem 'dalli', '~> 1.0.0'
#gem 'validation_reflection',      :branch => "rails-3"
