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

cerner_tomcat 'todo_api_tomcat' do
  user tomcat_user
  group tomcat_group
  base_dir '/opt/tomcat'
  log_dir '/opt/tomcat'
  log_rotate_options('rotate' => 1)
  java_settings('-Xms' => '512m',
                '-Xmx' => '512m',
                '-XX:PermSize=' => '384m',
                '-XX:MaxPermSize=' => '384m')
  init_info('Thing' => 'Value', 'Default-Start' => '1 2 3 4 5')
  limits(
    'open_files' => 65_536,
    'max_processes' => 4096
  )

  template 'conf/server.xml' do
    source 'server.xml.erb'
    variables(
      'port' => {
        'connector' => 8001,
        'shutdown' => 8002,
        'ajp' => 8003,
      })
  end
end
