#
# Cookbook Name::image_rails
# Recipe:: webapp_setup
#

require 'securerandom'

image_rails = node['image_rails']

magic_shell_environment 'SECRET_KEY_BASE' do
  value SecureRandom.hex(50)
  owner image_rails['user']
  group image_rails['group']
  mode "0600"
  destination "#{image_rails['home']}/.profile.d"
  not_if { ::File.exists?("#{image_rails['home']}/.profile.d/SECRET_KEY_BASE.sh") }
end

base_directory = "#{image_rails['home']}/image_rails"
config_directory = "#{image_rails['home']}/image_rails/shared/config"

directory "#{config_directory}" do
  recursive true
  action :create
  owner image_rails['user']
  group image_rails['group']
  mode "0755"
end

template "database config" do
  path "#{config_directory}/database.yml"
  source "database.yml.erb"
  action :create_if_missing
  variables db: image_rails['db']
end

template "local config" do
  path "#{config_directory}/settings.local.yml"
  source "settings.local.yml.erb"
  action :create_if_missing
  variables apis: image_rails['apis'], secret_key: SecureRandom.hex(50)
end
