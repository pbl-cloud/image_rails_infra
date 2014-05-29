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
