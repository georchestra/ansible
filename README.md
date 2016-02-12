# geOrchestra-ansible

A simple [ansible](http://docs.ansible.com) playbook to deploy a fullblown [geOrchestra](http://www.georchestra.org/) SDI instance.

## setup

You just need to setup variables for your own instance in ```playbooks/georchestra.yml```, point to the IP of a host where you have
ssh-with-passphrase root access in ```hosts``` file (ideally, an lxc container, or a vm, whatever suits you), and run

```
ansible-playbook playbooks/georchestra.yml

```
To deploy all the middleware and components. This has only been tested on Debian jessie (8.3) so far.

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

Create a virtual machine and provision it (according to the playbook), with:
```
vagrant up
```

Once the machine is provisioned, you can `vagrant ssh` into it, look around, and one you're done, you may halt the machine (`vagrant halt`) or destroy it (`vagrant destroy`).

## warning

THIS IS A WORK IN PROGRESS! Right now this will deploy a working georchestra from the master branch w/ geonetwork3/mapfishapp/geoserver/geowebcache
with mostly default configs and empty databases/datadirs.
