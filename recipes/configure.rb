template '/etc/grafana/grafana.ini' do
  owner 'root'
  group 'root'
  mode '0644'
  variables config: node['chef-grafana']['config']
  notifies :restart, 'service[grafana-server]'
end

# Make data/log dirs if we changed them from the defaults
directory node['chef-grafana']['config']['paths']['data'] do
  owner 'grafana'
  group 'grafana'
  mode '0755'
  recursive true
end

directory node['chef-grafana']['config']['paths']['logs'] do
  owner 'grafana'
  group 'grafana'
  mode '0755'
  recursive true
end
