require 'serverspec'

# Required by serverspec
set :backend, :exec

describe package('git') do
  it { should be_installed }
end

describe package('python-pip') do
  it { should be_installed }
end

describe file('/srv/salt/_modules/infratest.py') do
    it { should be_file }
    it { should be_mode 644 }
    it { should be_owned_by 'root' }
    it { should be_grouped_into 'root' }
end

describe file ('/usr/local/lib/python2.7/dist-packages/testinfra/__init__.py') do
  it { should be_file }
  it { should be_mode 644 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'staff' }
end
