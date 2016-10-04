#
# Cookbook Name:: phpcpd
# Attributes:: composer
#
# Copyright (c) 2016, David Joos
#

default['phpcpd']['install_dir'] = default['composer']['global_install']['install_dir']
if default['phpcpd']['install_method'] == 'composer'
  default['phpcpd']['bin_dir'] = default['composer']['global_install']['bin_dir']
end
