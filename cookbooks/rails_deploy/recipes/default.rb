#
# Cookbook:: rails_deploy
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

execute 'Configure GPG key for RVM' do
  command 'gpg2 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB'
end

execute 'Install RVM' do
  command '\curl -sSL https://get.rvm.io | bash -s stable'
end

execute 'Install Ruby' do
  command 'rvm install ruby-2.6.3'
end

execute 'Download Artifact' do
  command 'aws s3 sync s3://one-varsity-dev-artifacts/one_varsity_v1.0.0.tar.gz /home/ubuntu/one_varsity_v1.0.0.tar.gz'
end
