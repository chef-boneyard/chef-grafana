# Cookbook Name:: chef-grafana
# Recipe:: default

case node['platform_family']
when 'debian'
  # The http apt method isn't always installed by default, and we have a https
  # repository. Make sure it's installed.
  package 'apt-transport-https'

  apt_repository 'grafana' do
    uri 'https://packagecloud.io/grafana/stable/debian/'
    distribution 'wheezy' # This is used for all debian/ubuntu versions
    key 'https://packagecloud.io/gpg.key'
    components ['main']
    action :add
  end
when 'rhel'
  yum_repository 'grafana' do
    description 'Grafana - Stable'
    baseurl "https://packagecloud.io/grafana/stable/el/#{node['platform_version'].to_i}/$basearch"
    enabled true
    gpgcheck true
    gpgkey 'https://packagecloud.io/gpg.key https://grafanarel.s3.amazonaws.com/RPM-GPG-KEY-grafana'
    sslverify true
    action :create
  end
end

package 'grafana' do
  action :upgrade
  notifies :restart, 'service[grafana-server]'
end

service 'grafana-server' do
  action [:enable, :start]
end
