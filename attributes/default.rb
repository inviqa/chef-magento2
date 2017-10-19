default['nginx']['ssl_dir'] = "#{node['nginx']['dir']}/ssl"

node.override['varnish']['version'] = '4.0'
default['varnish']['use_varnishlog_service'] = false

default['varnish']['VARNISH_BACKEND_BETWEEN_BYTES_TIMEOUT'] = '60s'
default['varnish']['VARNISH_BACKEND_FIRST_BYTE_TIMEOUT'] = '60s'
default['varnish']['trusted_servers'] = [ '127.0.0.1' ]
default['varnish']['not_cache_static_files'] = false
default['varnish']['GeoIP2']['environments'] = []

default['mailcatcher']['enabled'] = true

default['magento']['cron']['user'] = 'nginx'
default['magento']['cron']['minute'] = '*'
default['magento']['cron']['hour'] = '*'

default['magento']['redis']['host'] = '/var/tmp/redis.sock'
default['magento']['redis']['port'] = '6379'
default['magento']['redis']['persistent'] = ''
default['magento']['redis']['cache_database'] = '0'
default['magento']['redis']['password'] = ''
default['magento']['redis']['force_standalone'] = '0'
default['magento']['redis']['connection_retries'] = 1;
default['magento']['redis']['read_timeout'] = 10;
default['magento']['redis']['automatic_cleaning_factor'] = '0'
default['magento']['redis']['compress_data'] = '1'
default['magento']['redis']['compress_tags'] = '1'
default['magento']['redis']['compress_threshold'] = '2048'
default['magento']['redis']['compression_lib'] = 'gzip'
default['magento']['redis']['lifetime_limit'] = 57600

default['magento']['memcached']['session_save_driver'] = 'memcache'

default['chown_allowed'] = true
