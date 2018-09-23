#
# Cookbook:: todo_api_cookbook
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

tomcat_user = 'tomcat'
tomcat_group = 'tomcat'

# Setup user/group
group tomcat_group do
  action :create
end

user tomcat_user do
  gid tomcat_group
  home "/home/#{tomcat_user}"
  manage_home true
end

cerner_tomcat "#{node['todo_api']['app']['name']}" do
  install_java false
  version node['todo_api']['tomcat']['version']

  cookbook_file 'conf/fullchain.pem' do
    source 'certs/fullchain.pem'
  end

  cookbook_file 'conf/privkey.pem' do
    source 'certs/privkey.pem'
  end

  cookbook_file 'conf/cert.pem' do
    source 'certs/cert.pem'
  end
  
  web_app 'ROOT' do
    source 'https://s3.ap-south-1.amazonaws.com/todos-api/todos-api.war'

    # cookbook_file 'WEB-INF/classes/database.properties' do
    #   source 'test/testFile'
    # end
    
    # template 'WEB-INF/classes/database.properties' do
    #   source 'test_file.erb'
    #   variables(
    #     'test_variable' => 'test_variable'
    #   )
    # end
  end

  # web_app 'todos-api' do
  #   source 'https://s3.ap-south-1.amazonaws.com/todos-api/todos-api.war'
  # end
end
