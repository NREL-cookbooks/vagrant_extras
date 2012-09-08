#
# Cookbook Name:: vagrant_extras
# Recipe:: passwordless_internal_ssh
#
# Copyright 2012, NREL
#
# All rights reserved - Do Not Redistribute
#

key_file = "/home/vagrant/.ssh/id_rsa"
public_key_file = "#{key_file}.pub"
authorized_keys_file = "/home/vagrant/.ssh/authorized_keys"

execute "ssh-keygen -f #{key_file} -N ''" do
  not_if { File.exists?(key_file) }
end

execute "cat #{public_key_file} >> #{authorized_keys_file}" do
  not_if { File.exists?(key_file) && File.read(authorized_keys_file).include?(File.read(public_key_file)) }
end
