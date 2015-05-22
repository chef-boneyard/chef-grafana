cookbook_file "home.json" do
  path "#{node['chef-grafana']['dashboard_path']}/home.json"
  owner "root"
  group "root"
  mode "0644"
end
