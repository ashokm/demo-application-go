#
# Cookbook Name:: goapp
# Recipe:: default
#
# Copyright 2015, Ashok Manji
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'supervisor'
include_recipe 'golang'

# Go package - Get, Install
golang_package node['goapp']['package'] do
  action :install
end

# Create user to run supervisor service
user node['goapp']['user'] do
  action :create
  system true
end

# Create Service
supervisor_service node['goapp']['name'] do
  command "/opt/go/bin/" + node['goapp']['name']
  action :enable
  autostart true
  user node['goapp']['user']
end
