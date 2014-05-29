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
  mode '0600'
  destination "#{image_rails['home']}/.profile.d"
  not_if { ::File.exists?("#{image_rails['home']}/.profile.d/SECRET_KEY_BASE.sh") }
end
