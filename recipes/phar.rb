#
# Cookbook Name:: phpcpd
# Recipe:: phar
#
# Copyright 2013-2014, Escape Studios
#

remote_file "#{node['phpcpd']['install_dir']}/phpcpd" do
  source node['phpcpd']['phar_url']
  mode 0755
end
