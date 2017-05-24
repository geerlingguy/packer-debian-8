# Packer Example - Debian 8 minimal Vagrant Box

**Current Debian Version Used**: 8.8.0

**Pre-built Vagrant Box**:

  - [`vagrant init geerlingguy/debian8`](https://vagrantcloud.com/geerlingguy/boxes/debian8)
  - See older versions: http://files.midwesternmac.com/

This example build configuration installs and configures Debian 8 amd64 minimal using Ansible, and then generates two Vagrant box files, for:

  - VirtualBox
  - VMware

The example can be modified to use more Ansible roles, plays, and included playbooks to fully configure (or partially) configure a box file suitable for deployment for development environments.

## Requirements

The following software must be installed/present on your local machine before you can use Packer to build the Vagrant box file:

  - [Packer](http://www.packer.io/)
  - [Vagrant](http://vagrantup.com/)
  - [VirtualBox](https://www.virtualbox.org/) (if you want to build the VirtualBox box)
  - [VMware Fusion](http://www.vmware.com/products/fusion/) (or Workstation - if you want to build the VMware box)
  - [Ansible](http://docs.ansible.com/intro_installation.html)

## Usage and configuration options

### Default build - VirtualBox and VMware boxes

Make sure all the required software (listed above) is installed, then cd to the directory containing this README.md file, and run:

```bash
    $ packer build debian8.json
```

After a few minutes, Packer should tell you the box was generated successfully.

### Building box only for one provider

If you want to only build a box for one of the supported virtualization platforms (e.g. only build the VMware box), add `--only=vmware-iso` to the `packer build` command:

```bash
    $ packer build --only=vmware-iso debian8.json
```

The switch for build VirtualBox box only is: '--virtualbox-iso'.

### Selecting integration components for the VMware box

You can select what kind of integration components will be installed into the VMware box

- [open-vm-tools](https://sourceforge.net/projects/open-vm-tools/)
- [VMware Tools](https://kb.vmware.com/selfservice/search.do?cmd=displayKC&docType=kc&docTypeID=DT_KB_1_1&externalId=340)

Selection can be done by assigning value to the parameter vmware_install_open_vm_tools. You can do it 

```bash
    $ packer build -var "vmware_install_open_vm_tools=true" ubuntu1404.json
```

By default VMware Tools are installed.

More about differences beetwen these two options you can read:

- [VMware support for Open VM Tools (2073803)](https://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=2073803) 
- [the open-vm-tools project page on GitHub](https://github.com/vmware/open-vm-tools)



## Testing built boxes

There's an included Vagrantfile that allows quick testing of the built Vagrant boxes. From this same directory, run one of the following commands after building the boxes:

    # For VMware Fusion:
    $ vagrant up vmware --provider=vmware_fusion
    
    # For VirtualBox:
    $ vagrant up virtualbox --provider=virtualbox

## License

MIT license.

## Author Information

Created in 2017 by [Jeff Geerling](http://jeffgeerling.com/), author of [Ansible for DevOps](http://ansiblefordevops.com/).
