#
# Cookbook Name:: image_rails
# Recipe:: setup
#

include_recipe "locale::default"

include_recipe "timezone-ii::default"

include_recipe "image_rails::packages"
