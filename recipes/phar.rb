#
# Cookbook Name:: phpcpd
# Recipe:: phar
#
# Copyright (c) 2016, David Joos
#

include_recipe 'php'

remote_file "#{node['phpcpd']['bin_dir']}/phpcpd" do
  source node['phpcpd']['phar_url']
  mode 0755
end
