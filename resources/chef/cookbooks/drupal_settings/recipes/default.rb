#
# Cookbook Name:: drupal_settings
# Recipe:: default
#
# Copyright 2014, BootDev
# www.BootDev.com
# All rights reserved - Do Not Redistribute
#
#execute 'call_chefserver' do
#  command "bash /etc/chef/run_update.sh"
#  retries 3
#  retry_delay 30
#  action :run
#end

#include_recipe 'drupal_settings::write_secret'

require 'chef/data_bag'

if File.exist?(node['drupal_settings']['secretpath'])
  bash "mount_if_gluster" do
    user "root"
    cwd "/tmp"
    code <<-EOH
      if [ `cat /etc/fstab|grep glusterfs| wc -l` -gt 0 ]; then
        mount `cat /etc/fstab|grep glusterfs| awk '{print $2}'`
        if [ -d "#{node['drupal_settings']['web_root']}/sites/default" ]; then
          ln -s `cat /etc/fstab|grep glusterfs| awk '{print $2}'` #{node['drupal_settings']['web_root']}/sites/default/files
          if [ `cat /etc/passwd|grep nginx| wc -l` -eq 1 ]; then
              chown nginx:nginx `cat /etc/fstab|grep glusterfs| awk '{print $2}'`
          else
            chown apache:apache `cat /etc/fstab|grep glusterfs| awk '{print $2}'`
          fi
        fi
      else
        if [ -d "#{node['drupal_settings']['web_root']}/sites/default" ]; then
          mkdir #{node['drupal_settings']['web_root']}/sites/default/files
          chmod 777 #{node['drupal_settings']['web_root']}/sites/default/files
          if [ `cat /etc/passwd|grep nginx| wc -l` -eq 1 ]; then
            chown nginx:nginx #{node['drupal_settings']['web_root']}/sites/default/files
          else
            chown apache:apache #{node['drupal_settings']['web_root']}/sites/default/files
          fi
        fi
      fi
    EOH
  end


  drupal_secret = IO.read(node['drupal_settings']['secretpath']).strip
  #Chef::EncryptedDataBagItem.load_secret(node['drupal_settings']['secretpath'])

  # Check if databag exists before applying templates
  if Chef::DataBag.list.key?('drupal')

    template "#{node['drupal_settings']['web_root']}/sites/default/basic.settings.php" do
      source "basic.settings.php"
      mode 0600
      retries 3
      retry_delay 30
      owner "nginx"
      group "nginx"
      action :create
      ignore_failure true
    end rescue NoMethodError

    # Check if DataBag item exist before applying templates
    if ! node['drupal_settings']['web_root'] =~ /drucloudaws/
    Database_Setting = Chef::EncryptedDataBagItem.load("drupal", "Database", drupal_secret)
    else
    Database_Setting = Chef::DataBagItem.load("drupal", "Database")
    end

    template "#{node['drupal_settings']['web_root']}/sites/default/settings.php" do
      source "settings.php"
      variables(
        :db_name => Database_Setting['db_name'], 
        :db_user => Database_Setting['db_user'],
        :db_passwd => Database_Setting['db_passwd'],
        :mysql_url => Database_Setting['mysql_url'],
      )
      mode 0600
      retries 3
      retry_delay 30
      owner "nginx"
      group "nginx"
      action :create
      ignore_failure true
    end

    if ! node['drupal_settings']['web_root'] =~ /drucloudaws/
      AWS_Setting = Chef::EncryptedDataBagItem.load("drupal", "AWS", drupal_secret)
    else
      AWS_Setting = Chef::DataBagItem.load("drupal", "AWS")
    end

    template "#{node['drupal_settings']['web_root']}/sites/default/aws.settings.php" do
      source "aws.settings.php"
      variables(
        :aws_key => AWS_Setting['aws_key'], 
        :aws_secret => AWS_Setting['aws_secret'],
      )
      mode 0600
      retries 3
      retry_delay 30
      owner "nginx"
      group "nginx"
      action :create
      ignore_failure true
    end
  
    begin
      if ! node['drupal_settings']['web_root'] =~ /drucloudaws/
        Memcache_Setting = Chef::EncryptedDataBagItem.load("drupal", "Memcache", drupal_secret)
      else
        Memcache_Setting = Chef::DataBagItem.load("drupal", "Memcache")
      end
    rescue Exception => e  
    end
    template "#{node['drupal_settings']['web_root']}/sites/default/memcache.settings.php" do
      source "memcache.settings.php"
      variables(
        :Memcache_server1 => Memcache_Setting['Memcache_server1'],
        :Memcache_port1 => Memcache_Setting['Memcache_port1'],
        :Memcache_server2 => Memcache_Setting['Memcache_server2'],
        :Memcache_port2 => Memcache_Setting['Memcache_port2']
      )
      mode 0600
      retries 3
      retry_delay 30
      owner "nginx"
      group "nginx"
      action :create
      ignore_failure true
    end rescue NoMethodError


    begin
      if ! node['drupal_settings']['web_root'] =~ /drucloudaws/    
        CDN_Setting = Chef::EncryptedDataBagItem.load("drupal", "CDN", drupal_secret)
      else
        CDN_Setting = Chef::DataBagItem.load("drupal", "CDN")
      end
    rescue Exception => e  
    end
    template "#{node['drupal_settings']['web_root']}/sites/default/cdn.settings.php" do
      source "cdn.settings.php"
      variables(
        :CDN => CDN_Setting['CDN'],
        :LoadBalancerDNS => CDN_Setting['LoadBalancerDNS']
      )
      mode 0600
      retries 3
      retry_delay 30
      owner "nginx"
      group "nginx"
      action :create
      ignore_failure true
    end rescue NoMethodError

  
    begin
      if ! node['drupal_settings']['web_root'] =~ /drucloudaws/
        S3CDN_Setting = Chef::EncryptedDataBagItem.load("drupal", "S3CDN", drupal_secret)
      else
        S3CDN_Setting = Chef::DataBagItem.load("drupal", "S3CDN")
      end
    rescue Exception => e
    end
    template "#{node['drupal_settings']['web_root']}/sites/default/s3cdn.setttings.php" do
      source "s3cdn.setttings.php"
      variables(
        :S3CDN => S3CDN_Setting['S3CDN']
      )
      mode 0600
      retries 3
      retry_delay 30
      owner "nginx"
      group "nginx"
      action :create
      ignore_failure true
    end rescue NoMethodError


    # Calling three templates by one data_bag
    begin
      if ! node['drupal_settings']['web_root'] =~ /drucloudaws/
        Host_n_storage_Setting = Chef::EncryptedDataBagItem.load("drupal", "Host_n_storage", drupal_secret)
      else
        Host_n_storage_Setting = Chef::DataBagItem.load("drupal", "Host_n_storage")
      end
    rescue Exception => e    
    end
    template "#{node['drupal_settings']['web_root']}/sites/default/cookie.settings.php" do
      source "cookie.settings.php"
      variables(
        :LoadBalancerDNS => Host_n_storage_Setting['LoadBalancerDNS']
      )
      mode 0600
      retries 3
      retry_delay 30
      owner "nginx"
      group "nginx"
      action :create
      ignore_failure true
    end rescue NoMethodError

    template "#{node['drupal_settings']['web_root']}/sites/default/s3.settings.php" do
      source "s3.settings.php"
      variables(
        :S3bucket => Host_n_storage_Setting['S3bucket']
      )
      mode 0600
      retries 3
      retry_delay 30
      owner "nginx"
      group "nginx"
      action :create
      ignore_failure true
    end rescue NoMethodError
    
    template "#{node['drupal_settings']['web_root']}/sites/default/xmlsitemap.settings.php" do
      source "xmlsitemap.settings.php"
      variables(
        :LoadBalancerDNS => Host_n_storage_Setting['LoadBalancerDNS'],
        :S3bucket => Host_n_storage_Setting['S3bucket']
      )
      mode 0600
      retries 3
      retry_delay 30
      owner "nginx"
      group "nginx"
      action :create
      ignore_failure true
    end rescue NoMethodError
  end
end

if ! node['drupal_settings']['web_root'] =~ /drucloudaws/
  service "nginx" do
    action :restart
    ignore_failure true
  end

  service "php-fpm" do
    action :restart
    ignore_failure true
  end
end
