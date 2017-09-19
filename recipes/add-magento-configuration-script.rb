node['magento']['instances'].each_value do |instance_details|
    configuration_script = File.join(instance_details['root_directory'].sub('current', 'shared'), 'configure-magento-config.php')

    mage_mode = node['nginx']['sites'][instance_details['get_magento_mode_from_this_site_config']]['mage_mode']

    template configuration_script do
        source 'configure-magento-config.php.erb'
        mode '0644'
        owner 'vagrant' if node['chown_allowed']
        group 'vagrant' if node['chown_allowed']
        variables({
            :magento => node['magento'],
            :instance_details => instance_details,
            :redis_host => instance_details['redis']['host'],
            :memcached_host => instance_details['memcached']['host'],
            :mage_mode => mage_mode
        })
    end
end
