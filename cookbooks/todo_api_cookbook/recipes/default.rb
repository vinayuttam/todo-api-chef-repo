#
# Cookbook:: todo_api_cookbook
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

cerner_tomcat 'todo_api' do
  install_java false
  version node['todo_api']['tomcat']['version']

  web_app 'ROOT' do
    source 'https://s3.ap-south-1.amazonaws.com/todos-api/todos-api.war'

    cookbook_file 'WEB-INF/classes/database.properties' do
      source 'test/testFile'
    end
  end

  # web_app 'todos-api' do
  #   source 'https://s3.ap-south-1.amazonaws.com/todos-api/todos-api.war'
  # end
end
