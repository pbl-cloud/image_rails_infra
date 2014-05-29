#
# Cookbook Name::image_rails
# Recipe:: webapp_users
#

image_rails = node['image_rails']

group image_rails['group'] do
  gid image_rails['user_gid']
end

user image_rails['user'] do
  comment "image_rails user"
  home image_rails['home']
  shell image_rails['shell']
  uid image_rails['user_uid']
  gid image_rails['group']
  supports manage_home: true
end

user image_rails['user'] do
  action :lock
end

cookbook_file "#{image_rails['home']}/.profile" do
  source "profile"
  mode 0644
  owner image_rails['user']
  group image_rails['group']
  action :create_if_missing
end

directory "#{image_rails['home']}/.profile.d" do
  mode 0755
  owner image_rails['user']
  group image_rails['group']
  action :create
  not_if { ::File.exists?("#{image_rails['home']}/.profile.d") }
end
