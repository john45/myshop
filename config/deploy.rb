# config valid only for current version of Capistrano
lock '3.5.0'

set :repo_url, 'https://github.com/john45/myshop'
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

set :user, 'deployer'
set :application, 'myshop'
set :rails_env, 'production'
server '139.59.211.196', user: fetch(:user).to_s, roles: %w(app db web), primary: true
# server '139.59.211.196', user: "#{fetch(:user)}", roles: %w{app db web}, primary: true
set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :pty, true

set :linked_files, fetch(:linked_files, []).push('config/database.yml',
                                                 'config/secrets.yml',
                                                 'config/puma.rb')
set :linked_dirs, fetch(:linked_dirs, []).push('log',
                                               'tmp/pids',
                                               'tmp/cache',
                                               'tmp/sockets',
                                               'vendor/bundle',
                                               'public/system',
                                               'public/uploads')

set :config_example_suffix, '.example'
set :config_files, %w(config/database.yml config/secrets.yml)
set :puma_conf, "#{shared_path}/config/puma.rb"

namespace :deploy do
  before 'check:linked_files', 'config:push'
  before 'check:linked_files', 'puma:config'
  before 'check:linked_files', 'puma:nginx_config'
  before 'deploy:migrate', 'deploy:db:create'
  after 'puma:smart_restart', 'nginx:restart'
end
