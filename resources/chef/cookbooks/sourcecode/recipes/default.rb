#
# Cookbook Name:: sourcecode
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


#create app user if not exist
execute "createappuser" do
	command "useradd -c 'app user' -s /bin/bash -m #{node[:sourcecode][:appuser]} -d /home/#{node[:sourcecode][:appuser]} -G apache"
	not_if "cat /etc/passwd | grep #{node[:sourcecode][:appuser]}"
end

execute "preparemountdir" do
	command "mkdir -p #{node[:sourcecode][:localsourcefolder]}"
end

execute "mountnfsfile" do
	command "mount -t nfs #{node[:sourcecode][:nfsserverip]}:#{node[:sourcecode][:nfssharefolder]} #{node[:sourcecode][:localsourcefolder]}"
	not_if "cat /proc/mounts | grep nfs"
end

execute "lntoapache" do
        command "rm -rf /var/www/html;ln -sf #{node[:sourcecode][:localsourcefolder]} /var/www/html"
end


template "/etc/httpd/conf/httpd.conf" do
	source "httpd.conf.erb"
	mode 0644
	owner "root"
	group "root"
end

execute "restarthttpd" do
	command '/etc/init.d/httpd restart'
	cwd '/root'
end

