#
# Cookbook Name:: workstations
# Recipe:: centos-permissions
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#
# Stop and disable iptables.
#
# @note this is not how you should manage your Linux instances
#
service "iptables" do
  action [ :stop, :disable ]
end

#
# Disable SELINUX context
#
# This is essential when you want to create the clowns/bears
# site content from the non-standard directories and ports. While the current
# content does not have those exercises it is now possible that they could be
# done with the selinux now disabled.
#
# @note this is not how you should manage your Linux instances
#
template "/etc/selinux/config" do
  source "selinux-config.erb"
  mode "0644"
end
