#
# Cookbook Name:: image_rails
# Recipe:: ruby
#

image_rails = node['image_rails']

include_recipe "ruby_build"

ruby_build_ruby image_rails['ruby'] do
  prefix_path "/usr/local/"
end

gem_package "bundler" do
  gem_binary "/usr/local/bin/gem"
  options "--no-ri --no-rdoc"
end
