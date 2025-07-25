require 'spec_helper'

describe package('nginx') do
  it { should be_installed }
end

# Frontend webserver (apache2)
describe port(80) do
  it { should be_listening }
end

describe port(443) do
  it { should be_listening }
end

# postgresql
describe port(5432) do
  it { should be_listening }
end

# OpenLDAP / slapd
describe port(389) do
  it { should be_listening }
end

# Elasticsearch
describe port(9200) do
  it { should be_listening }
end

# Kibana
describe port(5601) do
  it { should be_listening }
end

# tomcat-georchestra
describe port(8280) do
  it { should be_listening }
end

# tomcat-geoserver
describe port(8380) do
  it { should be_listening }
end

# tomcat-proxycas
describe port(8180) do
  it { should be_listening }
end

# datafeeder
describe port(8480) do
  it { should be_listening }
end

# gn-cloud-searching
describe port(8580) do
  it { should be_listening }
end

# gn-ogc-api-records
describe port(8880) do
  it { should be_listening }
end

# geOrchestra base debian packages should be present
[ 'georchestra-analytics',
  'georchestra-cas',
  'georchestra-console',
  'georchestra-datafeeder',
  'georchestra-datafeeder-ui',
  'georchestra-geoserver',
  'georchestra-geowebcache',
  'georchestra-security-proxy',
].each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

# geOrchestra datadir has been set up
describe file('/etc/georchestra') do
  it { should be_directory }
end
