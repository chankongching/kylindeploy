#!/bin/bash

####################
# Define variables
ID="KYLIN-"`date +%Y%m%d%H%M%S`
REGION=`curl http://169.254.169.254/latest/dynamic/instance-identity/document|grep region|awk -F\" '{print $4}'`
VpcId=<%= node[:vpc_id] %>
ScaleSubnet=<%= node[:subnet_id] %>
ELBSubnet=<%= node[:subnet_id] %>
KEYPAIR=`/home/ec2-user/tools/ec2-metadata -u|grep keyname|cut -d ':' -f2`
StackName=`cat /etc/chef/StackName`
SecurityGroupName=`/home/ec2-user/tools/ec2-metadata --security-groups|cut -d':' -f2|sed 's/ //g'`
SecurityGroupID=`/usr/bin/aws ec2 describe-security-groups --filters Name=group-name,Values=$SecurityGroupName|grep GroupId|cut -d':' -f2|sed 's/\"\|,\| //g'|head -1`

# chef client template path
TEMPLATE=/etc/chef/chefClients.template
####################
# Value to be input
AttachEBSsize=8
AvailabilityZone=`curl http://169.254.169.254/latest/dynamic/instance-identity/document|grep availabilityZone|awk -F\" '{print $4}'`
ChefAutoScaleSubnet=$ScaleSubnet
ChefLoadBalancerSubnet=$ELBSubnet
ChefServerURL=`/usr/bin/aws cloudformation describe-stacks --stack-name $StackName | jq .Stacks[].Outputs[].OutputValue|grep 443|sed 's/\"//g'`
ChefServerIp=`/usr/bin/aws cloudformation describe-stacks --stack-name $StackName | jq .Stacks[].Outputs[].OutputValue|grep 10.0|grep -v 10-|sed 's/\"//g'`
ChefServerPrivateKeyBucket=`/usr/bin/aws cloudformation describe-stacks --stack-name $StackName | jq .Stacks[].Outputs[].OutputValue|grep privatekeybucket|sed 's/\"//g'`
ChefVpc=$VpcId
InstancePort=7070
InstanceType=m4.xlarge
KeyName=$KEYPAIR
ProjectPrefix="chefclient-kylin"
RoleName="chefclient-kylin"
Scaling=0
VpcSecurityGroup=$SecurityGroupID

/usr/bin/aws cloudformation create-stack \
--stack-name $ID-chefclient \
--capabilities CAPABILITY_IAM \
--template-body file://$TEMPLATE \
--region $REGION \
--on-failure DO_NOTHING \
--parameters \
ParameterKey=AttachEBSsize,ParameterValue=$AttachEBSsize \
ParameterKey=AvailabilityZone,ParameterValue=$AvailabilityZone \
ParameterKey=ChefAutoScaleSubnet,ParameterValue=$ChefAutoScaleSubnet \
ParameterKey=ChefLoadBalancerSubnet,ParameterValue=$ChefLoadBalancerSubnet \
ParameterKey=ChefServerURL,ParameterValue=$ChefServerURL \
ParameterKey=ChefServerIp,ParameterValue=$ChefServerIp \
ParameterKey=ChefServerPrivateKeyBucket,ParameterValue=$ChefServerPrivateKeyBucket \
ParameterKey=ChefVpc,ParameterValue=$ChefVpc \
ParameterKey=InstancePort,ParameterValue=$InstancePort \
ParameterKey=InstanceType,ParameterValue=$InstanceType \
ParameterKey=KeyName,ParameterValue=$KeyName \
ParameterKey=ProjectPrefix,ParameterValue=$ProjectPrefix \
ParameterKey=Scaling,ParameterValue=$Scaling \
ParameterKey=RoleName,ParameterValue=$RoleName \
ParameterKey=VpcSecurityGroup,ParameterValue=$VpcSecurityGroup