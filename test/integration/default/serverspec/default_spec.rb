require 'spec_helper'

describe 'chef-grafana::default' do
  describe service('grafana') do
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
end
