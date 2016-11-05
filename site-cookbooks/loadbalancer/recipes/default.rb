#
# Cookbook Name:: loadbalancer
# Recipe:: default
#
# Copyright 2015, Ashok Manji
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'nginx'

template '/etc/nginx/sites-available/default' do
  source 'loadbalancer.conf.erb'
  mode '0644'
  owner 'root'
  group 'root'
  variables({
                :upstream_servers => node['loadbalancer']['upstream_servers']
            })
  notifies :reload, 'service[nginx]', :immediately
end

service 'nginx' do
  action [ :enable, :start ]
end
