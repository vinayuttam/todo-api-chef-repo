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
