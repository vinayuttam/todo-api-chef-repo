#
# Cookbook:: rails_deploy
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# Install Rbenv Globally
include_recipe 'ruby_build'

ruby_version = '2.6.3'

# Install Ruby
ruby_build_ruby "#{ruby_version}"

link '/usr/bin/ruby' do
  to "/usr/local/ruby/#{ruby_version}/bin/ruby"
end

package %w(dirmngr gnupg)

execute 'Add Nginx Passenger Repository' do
  command "sh -c 'echo deb https://oss-binaries.phusionpassenger.com/apt/passenger bionic main > /etc/apt/sources.list.d/passenger.list'"
end

execute 'Add keys' do
  command 'apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 561F9B9CAC40B2F7'
end

execute 'update packages' do
  command 'apt-get update'
end

apt_package 'nginx'
apt_package 'libnginx-mod-http-passenger'
