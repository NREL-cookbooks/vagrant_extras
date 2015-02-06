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

bash "ssh-keygen" do
  code <<-EOS
    mkdir -p /home/vagrant/.ssh
    chown vagrant:vagrant /home/vagrant/.ssh
    chmod 700 /home/vagrant/.ssh
    ssh-keygen -f #{key_file} -N ''
    chown vagrant:vagrant #{key_file} #{public_key_file}
  EOS

  not_if { File.exists?(key_file) }
end

bash "authorized_keys" do
  code <<-EOS
    cat #{public_key_file} >> #{authorized_keys_file}
    chown vagrant:vagrant #{authorized_keys_file}
    chmod 600 #{authorized_keys_file}
  EOS

  not_if { File.exists?(key_file) && File.read(authorized_keys_file).include?(File.read(public_key_file)) }
end
