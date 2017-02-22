#
# Cookbook Name:: workstations
# Recipe:: compliance
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

#
# Ensure the package repository is all up-to-date. This is essential
# because sometimes the packages will fail to install because of a
# stale package repository.
#
# @note This command is not idempotent. A better command may existin within the yum cookbook.
#
execute "yum update -y"

chef_ingredient 'chefdk' do
  action :install
end

include_recipe "#{cookbook_name}::centos-chef_user"

needed_packages_for_attendees = %w[ vim nano emacs git tree ]
package needed_packages_for_attendees

include_recipe "#{cookbook_name}::centos-docker"

include_recipe "#{cookbook_name}::centos-permissions"

include_recipe "#{cookbook_name}::centos-sshd_config"

