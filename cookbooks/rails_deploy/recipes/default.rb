#
# Cookbook:: rails_deploy
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

file '/home/ubuntu/text.text' do
  content 'test contents'
  mode '0755'
end
