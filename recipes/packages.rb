#
# Cookbook Name:: image_rails
# Recipe:: packages
#

image_rails = node['image_rails']

magic_shell_environment 'PATH' do
  value '/usr/local/bin:/usr/local/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin'
end

include_recipe "apt"

image_rails['packages'].each do |pkg|
  package pkg
end
