<?php
// Database connection to sharing host
$databases = array (
  'default' => array (
    'default' => array (
      'database' => 'crm',
      'username' => "<%= @dbuser %>",
      'password' => "<%= @password %>",
      'host' => "<%= @dbhost %>",
      'port' => '',
      'driver' => 'mysql',
      'prefix' => '',
    ),
  ),
);

$update_free_access = FALSE;
$drupal_hash_salt = '';

ini_set('session.gc_probability', 1);
ini_set('session.gc_divisor', 100);
ini_set('session.gc_maxlifetime', 200000);
ini_set('session.cookie_lifetime', 2000000);
$conf['404_fast_paths_exclude'] = '/\/(?:styles)|(?:system\/files)\//';
$conf['404_fast_paths'] = '/\.(?:txt|png|gif|jpe?g|css|js|ico|swf|flv|cgi|bat|pl|dll|exe|asp)$/i';
$conf['404_fast_html'] = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML+RDFa 1.0//EN" "http://www.w3.org/MarkUp/DTD/xhtml-rdfa-1.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><title>404 Not Found</title></head><body><h1>Not Found</h1><p>The requested URL "@path" was not found on this server.</p></body></html>';

$conf['memcache_servers'] = array(
   '172.16.102.225:11211' => 'default',
  #'172.16.102.107:11211' => 'default',
  #'172.16.102.112:11222' => 'default',
  #'172.16.102.113:11222' => 'default',
);
$conf['cache_backends'][] = 'sites/all/modules/memcache/memcache.inc';
$conf['lock_inc'] = 'sites/all/modules/memcache/memcache-lock.inc';
//$conf['memcache_stampede_protection'] = TRUE;
$conf['cache_default_class'] = 'MemCacheDrupal';
$conf['cache_class_cache_form'] = 'DrupalDatabaseCache';
$conf['memcache_key_prefix'] = 'crm';

//TZX testing environment
#$conf['tzx_domain'] = 'http://172.16.104.102:9081';
//TZX production environment
$conf['tzx_domain'] = 'http://172.16.103.182:9081';

// wx_card configuration
$conf['wx_member_card_id'] = 'pe8GejpiY38szJgGWZhG53UtbW9A';
$conf['wx_card_logo_url'] = 'http://mmbiz.qpic.cn/mmbiz_jpg/GAibT6GPsHibemnA3X33db6Dpkb8HibibnFMCgn9PXLhtGRJaRU58hTV57TSBM5bxtibLGDKcDOrycNcYlCtyTO6YeQ/0';
$conf['composer_manager_vendor_dir'] = 'sites/all/vendor';
$conf['composer_manager_file_dir'] = 'sites/default/files/composer';
