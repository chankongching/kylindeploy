#
# Cookbook Name:: azure
# Recipe:: kylin
#
# Copyright 2017, Kylin
#
# All rights reserved - Do Not Redistribute
#

# The flow of excution of command:
# 1. Storing everything from a stopped by existing container if not exist, then remove container
# 2. run command into container
# 3. create image from new container
# 4. remove new container
# So in any point of time, on host there shld be no container exists but image is upto date

aws = node[:deploycode][:configuration][:aws]

awsaction = aws[:action]
# storing kylin variables to be called
if not ((not (defined?(awsaction)).nil?) && (not "#{awsaction}" == ""))
  awsaction = "create"
end

credentials = aws[:credentials]

# Setting basedir to store template files
basedir = node[:deploycode][:basedirectory]
username = node[:deployuser]
#runtime = node[:deploycode][:runtime][:azure]

# storing kylin variables to be called
if (not (defined?(aws[:kylin])).nil?) && (not "#{aws[:kylin]}" == "")
  kylin = aws[:kylin]
end
identifier = kylin[:identifier]

# Check what scheme, "allinone" or "separated" to be deployed
if (not (defined?(aws[:scheme])).nil?) && (not "#{aws[:scheme]}" == "")
  scheme = aws[:scheme]
else
  scheme = "allinone"
end

# Name of docker container is not imaport, just make one
container_name = "#{node[:projectname]}_aws_#{identifier}"
# Aggregating operations into image, default = container_name
image_name = container_name

# Define committing docker images
# execute "commit_docker" do
# 	command "docker stop #{container_name};docker commit #{container_name} #{image_name}_tmp;docker rm #{container_name};docker rmi #{image_name};docker tag #{image_name}_tmp #{image_name};docker rmi #{image_name}_tmp"
#     action :nothing
# end

## Writing deployment info into host

# Create directory
if (not (defined?(kylin)).nil?) && (not "#{kylin}" == "")
  directory "#{basedir}aws/#{identifier}" do
    owner username
    group username
    mode '0755'
    recursive true
    action :create
  end

  if kylin[:region].downcase.include?("cn")
    accountregion = "china"
  else
    accountregion = "global"
  end

  ## Setting of variables
  kaptoken = ''
  if (not (defined?(kylin[:kaptoken])).nil?) && (not "#{kylin[:kaptoken]}" == "")
    kaptoken = kylin[:kaptoken]
  end

  ## Configuring default variable
  region = "cn-north-1"
  if (not (defined?(credentials[:region])).nil?) && (not "#{credentials[:region]}" == "")
    if ! credentials[:region].eql?("default")
      region = credentials[:region]
    end
  end

  keypair = kylin[:keypair]

  ## Configuring default variable Finished

  # Configuring AWS credentials
  directory '/root/.aws' do
    owner 'root'
    group 'root'
    mode 00755
    recursive true
    action :create
  end

  template "/root/.aws/config" do
    source "aws.config.erb"
    variables(
      :region => region
    )
    mode 0400
    retries 3
    retry_delay 2
    owner "root"
    group "root"
    action :create
  end
  template "/root/.aws/credentials" do
    source "aws.credentials.erb"
    variables(
      :awskey => credentials[:awskey],
      :awssecret => credentials[:awssecret]
    )
    mode 0400
    retries 3
    retry_delay 2
    owner "root"
    group "root"
    action :create
  end

  execute 'listS3' do
    command 'aws s3 ls'
    action :run
  end

  # Run checking for key pair
  execute "checkifkeypairexist" do
    command "export EXITCODE=`aws ec2 describe-key-pairs| grep #{keypair} | wc -l | awk {\'print $1\'}`;if [ \"$EXITCODE\" -eq \"1\" ]; then exit 0; else echo \"Keypair doesnt exist\";exit 1; fi"
  end
end