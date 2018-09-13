#
# Cookbook:: todo_api_cookbook
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

cerner_tomcat 'todo_api' do
  install_java false
  version '9.0.1'
end
