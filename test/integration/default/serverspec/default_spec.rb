require 'spec_helper'

describe 'chef-grafana::default' do
  describe service('grafana-server') do
    it { should be_enabled }
    it { should be_running }
  end

  describe process('grafana-server') do
    it { should be_running }
  end

  describe port(3000) do
    it { should be_listening }
  end

  describe package('grafana') do
    it { should be_installed }
  end

  describe file('/etc/grafana/grafana.ini') do
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
    it { should be_mode 644 }
    it { should contain '# Managed by Chef' }
  end
end
