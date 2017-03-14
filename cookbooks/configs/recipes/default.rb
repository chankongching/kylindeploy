#
# Cookbook Name:: configs
# Recipe:: default
#
# Copyright 2014, BootDev
# www.BootDev.com
# All rights reserved - Do Not Redistribute
#

basedir = node[:deploycode][:basedirectory]

if (not (defined?(node[:deploycode][:configuration][:general])).nil?) && (not "#{node[:deploycode][:configuration][:general]}" == "")
  node[:deploycode][:configuration][:general].each do |appname,spec|
    directory basedir + appname + "_configuration" do
      recursive true
      #Assume all root with docker
      owner 'root'
      group 'root'
      mode "0755"
      action :create
    end

    spec.each do | template_file,path |
      template "#{basedir}#{appname}_configuration/#{template_file}" do
        source template_file
        #Common config file setting
        mode "0644"
        retries 3
        retry_delay 10
        owner "root"
        group "root"
        action :create
        force_unlink true
        ignore_failure true
      end
    end
  end
end
