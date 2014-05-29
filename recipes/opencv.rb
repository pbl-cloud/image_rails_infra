#
# Cookbook Name::image_rails
# Recipe:: opencv
#

image_rails = node['image_rails']

archive_path = "/tmp/opencv-#{image_rails['opencv_version']}.zip"
source_path = "/tmp/opencv-#{image_rails['opencv_version']}"

remote_file archive_path do
  source image_rails['opencv_url']
  not_if { ::File.exists?("/usr/local/lib/libopencv_core.so")}
end

execute "extract opencv" do
  cwd "/tmp"
  command "unzip #{archive_path}"
  action :nothing
  subscribes :run, "remote_file[#{archive_path}]", :immediately
end

execute "opencv cmake" do
  cwd source_path
  command "cmake ."
  action :nothing
  subscribes :run, "execute[extract opencv]", :immediately
  notifies :run, "execute[opencv make]", :immediately
  notifies :run, "execute[opencv make install]", :immediately
end

execute "opencv make" do
  cwd source_path
  command "make"
  action :nothing
end

execute "opencv make install" do
  cwd source_path
  command "make install"
  action :nothing
end

file archive_path do
  action :nothing
  subscribes :delete, "execute[opencv cmake]"
end

directory source_path do
  recursive true
  action :nothing
  subscribes :delete, "execute[opencv cmake]"
end
