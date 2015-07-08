# geOrchestra-ansible

A simple [ansible](http://docs.ansible.com) playbook to deploy a fullblown [geOrchestra](http://www.georchestra.org/) SDI instance.

## setup

You just need to setup variables for your own instance in ```playbooks/georchestra.yml```, point to the IP of a host where you have
ssh-with-passphrase root access in ```hosts``` file (ideally, an lxc container, or a vm, whatever suits you), and run

```
ansible-playbook playbooks/georchestra.yml

```
To deploy all the middleware and components. This has only been tested on Debian jessie (8.1) so far.


## warning

THIS IS A WORK IN PROGRESS! Right now this will deploy a working georchestra w/ geonetwork/mapfishapp/geoserver/geowebcache/geofence
with mostly default configs and empty databases/datadirs.
