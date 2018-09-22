#
# Cookbook:: todo_api_cookbook
# Attribute:: default
#

# Default Java Cookbook Attributes
default['java']['install'] = false
default['java']['install_flavor'] = 'oracle'
default['java']['jdk_version'] = 8
default['java']['oracle']['accept_oracle_download_terms'] = true

# Cerner Tomcat Cookbook Attributes
default['tomcat']['version'] = '9.0.1'
default['tomcat']['user'] = 'tomcat'
default['tomcat']['group'] = 'tomcat'
