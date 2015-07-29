#
# Cookbook Name:: vagrant_extras
# Recipe:: ssl_cert
#
# Copyright 2011, NREL
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "/etc/ssl/certs/vagrant.key" do
  # Don't override custom certs
  action :create_if_missing
  source "ssl/vagrant.key"
  owner "root"
  group "root"
  mode "0600"
end

cookbook_file "/etc/ssl/certs/vagrant.crt" do
  # Don't override custom certs
  action :create_if_missing
  source "ssl/vagrant.crt"
  owner "root"
  group "root"
  mode "0600"
end

# Combined certificate for HAProxy.
execute "cat /etc/ssl/certs/vagrant.crt /etc/ssl/certs/vagrant.key > /etc/ssl/certs/vagrant.pem" do
  not_if { ::File.exists?("/etc/ssl/certs/vagrant.pem") }
end
