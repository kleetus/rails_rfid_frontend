$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require 'rvm/capistrano'
set :rvm_ruby_string, '1.9.2@rails_rfid'
set :rvm_type, :user

require 'bundler/capistrano'

set :application, "rails_rfid_frontend"
set :repository,  "git@github.com:kleetus/rails_rfid_frontend.git"


set :scm, :git
set :port, 12
set :user, "kleetus"
set :keep_releases, 2

set :deploy_to, "/home/kleetus/RAILS_APPS/rails_rfid_frontend"

role :web, "kleetus-xen.dyndns.org"
role :app, "kleetus-xen.dyndns.org"
role :db,  "kleetus-xen.dyndns.org", :primary => true


namespace :deploy do
  # desc "deploy restart"
  task :restart, :roles => :app, :except => {:no_release => true} do
    # stop
    # start
  end
  # 
  # task :start, :roles => :app, :except => {:no_release => true} do
  #   run "cd #{current_path} && bundle exec unicorn_exec start"
  # end
  # 
  # task :stop, :roles => :app, :except => {:no_release => true} do
  #   run "#{current_path}/bundle exec unicorn_exec stop"
  # end
end

