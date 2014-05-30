#
# Cookbook Name:: image_rails
# Recipe:: db_server
#

include_recipe "image_rails::setup"

include_recipe "mysql::server"
