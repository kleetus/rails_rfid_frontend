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
  after 'deploy:symlink' do
    run "ln -nfs #{shared_path}/database.yml #{release_path}/config/database.yml"
  end
  
  task :restart, :roles => :app, :except => {:no_release => true} do
    run 'sudo /etc/init.d/unicorn restart'
    cleanup
  end
  
  task :start, :roles => :app, :except => {:no_release => true} do
    run 'sudo /etc/init.d/unicorn start'
  end
  
  task :stop, :roles => :app, :except => {:no_release => true} do
    run 'sudo /etc/init.d/unicorn stop'
  end
end