script "download_composer" do
  interpreter "bash"
  user "root"
  code <<-EOH
  cd /root
  curl -sS https://getcomposer.org/installer | php
  mv composer.phar /usr/local/bin/composer
  ln -s /usr/local/bin/composer /usr/bin/composer
  EOH
end

execute "install_drush_nginx" do
  user "nginx"
  group "nginx"
  environment ({'HOME' => '/var/lib/nginx', 'USER' => 'nginx'})
  command <<-EOH
    n=0;until [ $n -ge 5 ];do ls /usr/bin/composer; [ $? -eq 0 ] && break;n=$[$n+1];sleep 10;done;
    source /var/lib/nginx/.bashrc
    /usr/local/bin/composer global require drush/drush:dev-master
    sed -i '1i export PATH="$HOME/.composer/vendor/bin:$PATH"' ~/.bashrc
    source ~/.bashrc
  EOH
  ignore_failure true
end

execute "install_drush_ec2user" do
  user "ec2-user"
  group "ec2-user"
  environment ({'HOME' => '/home/ec2-user', 'USER' => 'ec2-user'})
  command <<-EOH
    n=0;until [ $n -ge 5 ];do ls /usr/bin/composer; [ $? -eq 0 ] && break;n=$[$n+1];sleep 10;done;
    source /home/ec2-user/.bashrc
    /usr/local/bin/composer global require drush/drush:dev-master
    sed -i '1i export PATH="$HOME/.composer/vendor/bin:$PATH"' ~/.bashrc
    source ~/.bashrc
  EOH
end

script "install_drush_root" do
  interpreter "bash"
  user "root"
  code <<-EOH
    cd
    n=0;until [ $n -ge 5 ];do ls /usr/bin/composer; [ $? -eq 0 ] && break;n=$[$n+1];sleep 10;done;
    nohup /usr/local/bin/composer global require drush/drush:dev-master &
    sed -i '1i export PATH="$HOME/.composer/vendor/bin:$PATH"' $HOME/.bashrc
    source $HOME/.bashrc
    if [ -d /var/lib/nginx ];
    then
      cp /home/ec2-user/.b* /var/lib/nginx
      chown nginx:nginx /var/lib/nginx/.b*
    fi
  EOH
end

execute "set_php_apc" do
  user "root"
  group "root"
  command "if [ -f /etc/php.d/apc.ini ];then /bin/sed -i 's/apc.enable_cli=.*/apc.enable_cli = Off/' /etc/php.d/apc.ini;fi"
end
