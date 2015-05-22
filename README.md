# chef-grafana

This cookbook installs and configures Grafana 2, a dashboard application for
graphite and influxdb.

## Recipes

The default recipe will install grafana 2, configure grafana.ini, and start
the service.

Other recipes:

* grafana::install - this installs grafana and starts the service, but doesn't
  perform any configuration of grafana.ini.
* grafana::configure - this configures grafana.ini.
* grafana::default_dashboards - this replaces the home dashboard with a
  different file.

## Configuration

All grafana.ini configuration is provided through attributes. Set
`node['chef-grafana']['config']['section']['config']` to set the appropriate
values. For example, if you want to enable anonymous authentication, you can
set `node['chef-grafana']['config']['auth.anonymous']['enabled']` to true.
