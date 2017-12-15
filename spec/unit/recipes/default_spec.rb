require 'spec_helper'

describe 'default recipe on Ubuntu 14.04' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new do |node|
      node.automatic[:lsb][:codename] = 'trusty'
    end.converge('chef-grafana::default')
  end

  let(:chef_run_versioned) do
    ChefSpec::ServerRunner.new do |node|
      node.automatic['chef-grafana']['install']['version'] = '4.5.0'
    end.converge('chef-grafana::default')
  end

  context 'latest version' do
    it 'converges successfully' do
      expect { :chef_run }.to_not raise_error
    end

    it 'upgrades successfully' do
      expect(chef_run).to upgrade_package('grafana')
    end
  end

  context 'specific version' do
    it 'converges successfully' do
      expect { :chef_run_versioned }.to_not raise_error
    end

    it 'installs successfully' do
      expect(chef_run_versioned).to install_package('grafana').with(version: '4.5.0')
    end
  end
end
