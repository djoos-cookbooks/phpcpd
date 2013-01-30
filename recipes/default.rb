#
# Cookbook Name:: phpcpd
# Recipe:: default
#
# Copyright 2013, Escape Studios
#

include_recipe "php"

#PHP Extension and Application Repository PEAR channel
php_pear_channel "pear.php.net" do
  action :update
end

#upgrade PEAR
php_pear "PEAR" do
	action :upgrade
end

#PHPUnit PEAR channel
pearhub_chan = php_pear_channel "pear.phpunit.de" do
	action :discover
end

#upgrade phpcpd
php_pear "phpcpd" do
	channel pearhub_chan.channel_name
	if node[:phpcpd][:version] != "latest"
		version "#{node[:phpcpd][:version]}"
	end
	action :upgrade
end