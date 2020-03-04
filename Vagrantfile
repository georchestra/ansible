# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

$script = <<SCRIPT
echo configuring ssh in guest...
sudo sed -i '/AcceptEnv/d' /etc/ssh/sshd_config
sudo /etc/init.d/ssh restart
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "debian/buster64"

  # set CPU and RAM
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "4096"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
  end

  # Create a public network, which generally matches to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  config.vm.network :public_network
  config.vm.network :forwarded_port, guest: 22, host: 9999, id: "ssh"

  # We do not care about security here and want to keep using the default insecure key:
  config.ssh.insert_key = false

  # Give a nice name ("georchestra") to the VM:
  config.vm.define "georchestra" do |georchestra|
  end

  config.vm.provision "shell", inline: $script

  config.vm.provision "ansible" do |ansible|
    # execute this playbook for vm provisioning:
    ansible.playbook = "playbooks/georchestra.yml"
    # display ansible-playbook output:
    ansible.verbose = "v"
    # limit ansible-playbook execution to one machine:
    ansible.limit = "mygeorchestra"
    # ... as referenced in our "hosts" file:
    ansible.inventory_path = "hosts"
    # ssh connection parameters for ansible:
    ansible.extra_vars = { ansible_ssh_host: '127.0.0.1', ansible_ssh_user: 'vagrant', ansible_ssh_port: 9999 }
  end

  config.vm.post_up_message = "geOrchestra SDI installed, congrats! See https://www.georchestra.org/community.html for help and bug reports"

end
