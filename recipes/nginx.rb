#
# Cookbook Name::image_rails
# Recipe:: nginx
#

# TODO: add specs

image_rails = node['image_rails']

%w{ sites-enabled sites-available }.each do |dir|
  directory "/etc/nginx/#{dir}" do
    recursive true
    action :create
    mode "0755"
  end
end

cookbook_file "mime.types" do
  path "/etc/nginx/mime.types"
end

template "image_rails server" do
  path "/etc/nginx/sites-available/image_rails"
  source "image_rails_server.erb"
  action :create_if_missing
  variables server: image_rails['server'], app_path: image_rails['app_dir']
end


link "/etc/nginx/sites-enabled/image_rails" do
  to "/etc/nginx/sites-available/image_rails"
end

include_recipe "nginx::default"
