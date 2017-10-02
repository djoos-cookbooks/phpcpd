#
# Cookbook Name:: phpcpd
# Recipe:: composer
#
# Copyright (c) 2016, David Joos
#

include_recipe 'composer'

install_dir = node['phpcpd']['install_dir']

# figure out what version to install
version = if node['phpcpd']['version'] != 'latest'
            node['phpcpd']['version']
          else
            '*.*.*'
          end

composer_install_global 'sebastian/phpcpd' do
  install_dir install_dir
  version version
  bin_dir node['phpcpd']['prefix']
end
