# Cookbook Name:: chef-grafana
# Recipe:: default

# The http apt method isn't always installed by default, and we have a https
# repository. Make sure it's installed.
package "apt-transport-https"

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
