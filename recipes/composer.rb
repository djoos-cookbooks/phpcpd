#
# Cookbook Name:: phpcpd
# Recipe:: composer
#
# Copyright (c) 2016, David Joos
#

include_recipe 'composer'

phpcpd_dir = node['phpcpd']['install_dir']

directory phpcpd_dir do
  owner 'root'
  group 'root'
  mode 0755
  action :create
end

# figure out what version to install
version = if node['phpcpd']['version'] != 'latest'
            node['phpcpd']['version']
          else
            '*.*.*'
          end

# composer.json
template "#{phpcpd_dir}/composer.json" do
  source 'composer.json.erb'
  owner 'root'
  group 'root'
  mode 0600
  variables(
    :version => version,
    :bindir => node['phpcpd']['bin_dir']
  )
end

# composer update
execute 'phpcpd-composer' do
  user 'root'
  cwd phpcpd_dir
  command 'composer update'
  action :run
end
