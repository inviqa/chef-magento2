node['magento']['instances'].each do |instance_name, instance_details|
    configuration_script = File.join(instance_details['root_directory'].sub('current', 'shared'), 'install-magento2.sh')

    template configuration_script do
        source 'install-magento2.sh.erb'
        mode '0644'
        owner 'vagrant' if node['chown_allowed']
        group 'vagrant' if node['chown_allowed']
        variables({
            :magento => node['magento'],
            :instance_details => instance_details,
            :db_host => instance_details['db']['host'],
            :db_password => node['mysql']['users'][instance_details['db']['username']]['password']
        })
    end
end
