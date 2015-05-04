# Cookbook Name:: chef-grafana
# Recipe:: default

apt_repository 'grafana' do
  uri 'https://packagecloud.io/grafana/stable/debian/'
  distribution 'wheezy' # This is used for all debian/ubuntu versions
  key 'https://packagecloud.io/gpg.key'
  components ["main"]
  action :add
end

package "grafana"

service "grafana-server" do
  action [:enable, :start]
end
