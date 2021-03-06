require 'bundler/capistrano'
# require 'hoptoad_notifier/capistrano'
require 'capistrano/local_precompile'

set :application, "loan_query_app"
set :rails_env, "production"
set :default_shell, '/bin/bash -l'

set :branch, "master"
set :repository,  "https://github.com/KosbrotherSchool/loan_web_app.git"
set :scm, "git"
set :user, "apps" # 一個伺服器上的帳戶用來放你的應用程式，不需要有sudo權限，但是需要有權限可以讀取Git repository拿到原始碼

set :deploy_to, "/home/apps/loan_query_app"
# set :deploy_via, :remote_cache
set :use_sudo, false

# set :precompile_cmd             # default: bundle exec rake assets:precompile
# set :assets_dir                 # default: "public/assets"
# set :rsync_cmd                  # default: "rsync -av"

role :web, "106.187.50.158"
role :app, "106.187.50.158"
role :db,  "106.187.50.158", :primary => true

namespace :deploy do

  task :copy_config_files, :roles => [:app] do
    db_config = "#{shared_path}/config/database.yml"
    env_config = "#{shared_path}/config/local_env.yml"
    application_confg = "#{shared_path}/config/application.yml"
    run "cp #{db_config} #{release_path}/config/database.yml"
    run "cp #{env_config} #{release_path}/config/local_env.yml"
    run "cp #{application_confg} #{release_path}/config/application.yml"
  end
  
  task :update_symlink do
    run "ln -s {shared_path}/public/system {current_path}/public/system"
  end
  
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

# recipes/sitemap.rb
  namespace :sitemap do
    desc "Generate sitemap.xml.gz"
    task :generate, roles: :web do
    run "cd #{deploy_to}/current && /usr/bin/env bundle exec rake sitemap:refresh RAILS_ENV=#{rails_env}"
  end
  after "deploy:restart", "sitemap:generate"
  
end

before "deploy:assets:precompile", "deploy:copy_config_files" # 如果將database.yml放在shared下，請打開
after "deploy:update_code", "deploy:copy_config_files" # 如果將database.yml放在shared下，請打開
# after "deploy:finalize_update", "deploy:update_symlink" # 如果有實作使用者上傳檔案到public/system，請打開