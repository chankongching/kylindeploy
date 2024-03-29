#source configuration
default[:kylin][:code_owner] = "hdfs"
default[:kylin][:code_group] = "hdfs"
default[:kylin][:installscript] = 'https://raw.githubusercontent.com/Kyligence/Iaas-Applications/master/KAP/scripts/KAP-install-aws_v0.sh'
default[:kylin][:kyanalyzerjarlib] = 'https://kyhub.blob.core.chinacloudapi.cn/packages/jarlib/mondrian-kylin-2.0.jar'
default[:kylin][:var_adminuser] = "ADMINUSER"
default[:kylin][:var_adminpassword] = "ADMINPASSWORD"
default[:kylin][:var_apptype] = "APPTYPE"
default[:kylin][:var_kyaccountToken] = "KYACCOUNTTOKEN"
default[:kylin][:emrserver] = "EMRSERVER"
default[:kylin][:s3location] = ""
default[:kylin][:var_kapagentid] = "KAPAGENTID"
default[:kylin][:var_kapurl] = "KAPURL"
default[:kylin][:var_kyanalyzerurl] = "KYANALYZERURL"
default[:kylin][:var_zeppelinurl] = "ZEPPELINURL"
default[:kylin][:s3bucketname] = "CHEFPRIVATEBUCKET"

# default[:kylin][:kylin_tarball]='https://s3.cn-north-1.amazonaws.com.cn/bootdevcn/apache-kylin-1.5.4.1-hbase1.x-bin.tar.gz'
# default[:kylin][:KAP_DOWNLOAD_URI]='https://kyhub.blob.core.chinacloudapi.cn/packages/kap/'
# default[:kylin][:KAP_TARFILE]='kap-2.3.7-GA-hbase1.x.tar.gz'

#Path of KAP
#https://olapio.sharepoint.com/products/_layouts/15/guestaccess.aspx?guestaccesstoken=jipVmtq%2fT6%2b2Uu3ZGhVlV2CCFWXtiJsueBxJU0otHFI%3d&docid=044c0dbd8160c4a11a73264001f658b4c&rev=1
#default[:kylin][:kylin_tarball]='https://archive.apache.org/dist/kylin/apache-kylin-1.5.4/apache-kylin-1.5.4-HBase1.x-bin.tar.gz'
#default[:kylin][:kylin_tarball]='https://archive.apache.org/dist/kylin/apache-kylin-1.5.2/apache-kylin-1.5.2-HBase1.x-bin.tar.gz'
#default[:kylin][:kylin_tarball]='https://archive.apache.org/dist/kylin/apache-kylin-1.5.2.1/apache-kylin-1.5.2.1-HBase1.x-bin.tar.gz'
