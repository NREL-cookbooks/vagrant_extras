#
# Cookbook Name:: vagrant_extras
# Recipe:: ssl_cert
#
# Copyright 2011, NREL
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "/etc/ssl/vagrant.key" do
  source "ssl/vagrant.key"
  owner "root"
  group "root"
  mode "0600"
end

cookbook_file "/etc/ssl/vagrant.crt" do
  source "ssl/vagrant.crt"
  owner "root"
  group "root"
  mode "0600"
end
