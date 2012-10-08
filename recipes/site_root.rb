#
# Cookbook Name:: vagrant_extras
# Recipe:: site_root
#
# Copyright 2012, NREL
#
# All rights reserved - Do Not Redistribute
#

directory "/srv/sites" do
  owner "vagrant"
  group "vagrant"
  mode "0755"
  recursive true
end
