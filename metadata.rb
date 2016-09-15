name 'chef-grafana'
maintainer 'Mark Harrison'
maintainer_email 'mharrison@chef.io'
license 'Apache 2.0'
description 'Installs/Configures grafana'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))

version '0.2.2'

%w(ubuntu debian).each do |os|
  supports os
end

source_url 'https://github.com/chef-cookbooks/chef-grafana'
issues_url 'https://github.com/chef-cookbooks/chef-grafana/issues'
chef_version '>= 12.1'
depends 'apt'
