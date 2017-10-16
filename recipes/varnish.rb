include_recipe 'chef-varnish::default'

vcl = resources("template[#{node['varnish']['config_dir']}/default.vcl]")
vcl.cookbook 'magento2'
vcl.source 'varnish.vcl.erb'
vcl.variables(
  varnish: node['varnish'],
  magento: node['magento']
)

config = resources("template[#{node['varnish']['daemon_config']}]")
config.cookbook 'magento2'

if node['varnish']['GeoIP2']['enabled']
  config = resources("template[#{node['varnish']['config_dir']}/geoip.vcl]")
  config.cookbook 'magento2'
end
