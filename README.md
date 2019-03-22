# geOrchestra-ansible

A simple [ansible](http://docs.ansible.com) playbook to deploy a fullblown [geOrchestra](http://www.georchestra.org/) SDI instance.

This will deploy a working geOrchestra from the **18.12** branch with mostly default configs and empty databases/datadirs.


## setup

In order to deploy all the middleware and components of a geOrchestra instance, you just need to:
 * setup variables for your own instance in ```playbooks/georchestra.yml```,
 * point to the IP of a host where you have ssh-with-passphrase root access in the ```hosts``` file (ideally, an lxc container, or a vm, whatever suits you)

... and run:
```
ansible-playbook playbooks/georchestra.yml
```

This is meant to work on a Debian Stretch (9.x) VM.

## cleanup

If you want to remove/cleanup the webapps, databases, LDAP DIT and datadirs, sub-tasks have been added and can be run using

```
ansible-playbook -t cleanup -e "cleanup=true" playbooks/georchestra.yml

```
Those sub-tasks aren't run by default, you need to specify the `cleanup=true` variable.

## example setup with vagrant

Install the dependencies with:
```
sudo apt-get install vagrant virtualbox ansible
```

Optionally, to install the "guest additions", you may run:
```
vagrant plugin install vagrant-vbguest
```

Finally, create a virtual machine and provision it (according to the playbook), with:
```
vagrant up
```

When the machine is provisioned, you can `vagrant ssh` into it, look around, and once you're done, you may halt the machine (`vagrant halt`) or destroy it (`vagrant destroy`).

To browse your SDI, just drop a line in your ```/etc/hosts``` file, registering the IP of the VM with the FQDN you declared in the playbook, eg:
```
192.168.0.19 georchestra.example.org
```
... and open https://georchestra.example.org/geonetwork/ in your browser.
