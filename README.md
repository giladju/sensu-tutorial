# Sensu Tutorial

## Prerequistes

### VirtualBox

```
> VBoxManage --version
5.0.10r104061
```

### Vagrant

```
> vagrant version 
Installed Version: 1.7.4
Latest Version: 1.7.4
```

### Add Vagrant Base Box

```
vagrant box add ubuntu-natty-64 https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box
```

## General

### Starting up the VMs

```
vagrant up
```

### Listing the VMs

```
vagrant status
```

### Accessing the VMs

```
vagrant ssh <VM-NAME>
```
