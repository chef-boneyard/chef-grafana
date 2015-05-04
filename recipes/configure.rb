template "/etc/grafana/grafana.ini" do
  owner "root"
  group "root"
  mode "0644"
  variables :config => node['chef-grafana']['config']
  notifies :restart, "service[grafana-server]"
end
