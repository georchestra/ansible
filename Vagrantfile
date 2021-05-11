# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "debian/buster64"

  # set CPU and RAM
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "16384"]
    vb.customize ["modifyvm", :id, "--cpus", "4"]
  end

  # We do not care about security here and want to keep using the default insecure key:
  config.ssh.insert_key = false

  # Give a nice name ("georchestra") to the VM:
  config.vm.define "georchestra" do |georchestra|
  end

  config.vm.provision "ansible" do |ansible|
    # execute this playbook for vm provisioning:
    ansible.playbook = "playbooks/georchestra.yml"
    # display ansible-playbook output:
    ansible.verbose = "v"
  end

  config.vm.post_up_message = "geOrchestra SDI installed, congrats! See https://www.georchestra.org/community.html for help and bug reports"

end
