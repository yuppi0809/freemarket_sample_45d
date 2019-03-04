# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, 'freemarket_sample_45d'
set :repo_url,  'git@github.com:JJ-302/freemarket_sample_45d.git'

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/jackie-relive.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

set :default_env, {
  rbenv_root: "/usr/local/rbenv",
  path: "/usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH",
  RECAPTCHA_SITE_KEY: ENV["RECAPTCHA_SITE_KEY"],
  RECAPTCHA_SECRET_KEY: ENV["RECAPTCHA_SECRET_KEY"],
  BASIC_AUTH_USER: ENV["BASIC_AUTH_USER:"],
  BASIC_AUTH_PASSWORD: ENV["BASIC_AUTH_PASSWORD"]
}
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
end
