# deploy.rb
lock '3.4.0'

set :application, 'new-app'
set :repo_url, 'git@github.com:thanhmancity/new-app.git'
set :deploy_to, '/var/www/new-app'
set :log_level, :debug

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets}

#set :bundle_env_variables, { nokogiri_use_system_libraries: 1 }
#set :bundle_env_variables, { 'NOKOGIRI_USE_SYSTEM_LIBRARIES' => 1 }
namespace :deploy do
 desc 'Restart application'
 task :restart do
 invoke 'unicorn:restart'
 end
end
after 'deploy:publishing', 'deploy:restart'
