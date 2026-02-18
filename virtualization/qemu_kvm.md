
# QEMU/KVM Installation and Virtual Machine Setup On Ubuntu

## 1. Overview

This document describes the installation and configuration of QEMU/KVM on Ubuntu,
including virtualization verification, package installation, service validation,
and user permissions setup for virtual machine management.

The goal of this setup is to create and manage local virtual machines using KVM and libvirt.


## 2. Requirements

- Ubuntu Linux (Host)
- CPU with hardware virtualization support (Intel VT-x or AMD -V)


## 3. Verify Hardware Virtualization Support

```bash
lscpu
```

Look for: 
Virtualization: VT-X or AMD-V

### 3.1 Check CPU Information

```bash
egrep -c '(vmx|svm)' /proc/cpuinfo
```

If the output is greater than 0, hardware virtualization is supported.
vmx -> Intel
svm -> AMD


## 4. Install Required Packages

Update package list
```bash
sudo apt update
```
Install virtualization packages:
```bash
sudo apt install qemu-kvm virt-manager bridge-utils
```
qemu-kvm -> Hypervisor
virt-manager -> GUI management tool
bridge-utils -> Network bridging support

Ensure kernel modules are properly loaded by rebooting
```bash
sudo reboot now
```


## 5. Verify libvirt Service

After reboot, check libvirt daemon status
```bash
sudo systemctl status libvirtd
```
Expected result:
```bash
active (running)
```


## 6. Configure User Permissions

To manage virtual machines without root privileges, add the user to required groups:
```bash
sudo usermod -aG libvirt $USER 
```


## 7. Verify KVM Installation

Check loaded modules:
```bash
lsmod | grep kvm
```

You should see:
```bash
kvm_intel
or
kvm_amd
```


## 8. Creating Virtual Machines

Virtual machines can be created with;
virt-manager (GUI)
virt-manager (CLI)

Example using virt-manager:
```bash
virt-manager
```
Steps:
1. File -> New Virtual Machine 
2. Select installation media
3. Allocate memory and CPU
4. Configure disk size
5. Choose network configuration (NAT & Bridge)
6. Proceed to installation on console

## 9. Conclusion

This setup provides:

Local virtualization using KVM
GUI and CLI management options
