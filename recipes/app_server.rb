#
# Cookbook Name:: image_rails
# Recipe:: app_server
#

include_recipe "image_rails::setup"

include_recipe "image_rails::ruby"

include_recipe "image_rails::opencv"

include_recipe "image_rails::webapp_users"

include_recipe "image_rails::webapp_setup"

include_recipe "image_rails::nginx"
