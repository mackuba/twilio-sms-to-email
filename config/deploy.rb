require 'bundler/capistrano'

set :application, "twilio"
set :repository, "git@github.com:jsuder/twilio-sms-to-email.git"
set :scm, :git
set :keep_releases, 5
set :use_sudo, false
set :deploy_to, "/var/www/twilio"
set :deploy_via, :remote_cache

server "matterhorn", :app, :web, :db, :primary => true
