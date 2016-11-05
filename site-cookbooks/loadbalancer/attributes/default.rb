#
# Cookbook Name:: loadbalancer
# Attributes:: default
#
# Copyright 2015, Ashok Manji
#
# All rights reserved - Do Not Redistribute
#

default['loadbalancer']['balancing_method'] = 'round_robin' #(round_robin|least_conn|ip_hash)
default['loadbalancer']['upstream_servers'] = nil
