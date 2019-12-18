# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile.html

# A name that describes what the system you're building with Chef does.
name 'rails_deploy'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list 'rails_deploy::default'

# Specify a custom source for a single cookbook:
cookbook 'rails_deploy', path: '.'
cookbook 'ruby_build', '~> 1.2.0', :supermarket
