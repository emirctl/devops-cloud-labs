# Local Virtualization Lab with Cockpit and SSH Hardening

## 1. Overview

This project documents the setup of a local virtualization environment using Cockpit as a web-based management interface for KVM/libvirt virtual machines.

The purpose of this lab is to:

- Deploy multiple Ubuntu Server virtual machines
- Configure secure SSH access
- Apply basic SSH hardening
- Understand libvirt networking (NAT vs Bridge)
- Prepare the environment for future automation (Ansible, Terraform)

This lab simulates a small on-prem infrastructure environment.


---


## 2. Architecture

Physical Host (Ubuntu Linux)
│
├── KVM Hypervisor
├── libvirt
└── Cockpit (Web Interface)
│
├── VM-1
├── VM-2
└── VM-3
│
└── SSH Key-Based Access


---


## 3. Environment Details

| Component | Description |
|------------|-------------|
| Host OS | Ubuntu Linux |
| Virtualization | KVM + libvirt |
| Management | Cockpit |
| Guest OS | Ubuntu Server 22.04 |
| Network | NAT (default libvirt network) |
| Access | SSH (key-based authentication) |

---

## 4. Cockpit Installation

### Install Cockpit

```bash
sudo apt update
sudo apt install cockpit cockpit-machines
```


### Enable Service
```bash
sudo systemctl enable --now cockpit
```

Access Web UI
https://<host-ip>:9090


Login using host system credentials.

### 5. Virtual Machine Creation

VMs were created using Cockpit’s Machines interface.

VM Configuration

2 vCPU

2 GB RAM

20 GB disk (qcow2)

Ubuntu Server ISO

NAT networking (default libvirt)

Verify VMs:

```bash
virsh list --all
```

Start VM:

```bash
virsh start <vm-name>
```

Console access:

virsh console <vm-name>

### 6. SSH Setup
Generate SSH Key (Host)
```bash
ssh-keygen -t ed25519
```

Copy Key to VM
```bash
ssh-copy-id user@<vm-ip>
```

Test connection:
```bash
ssh user@<vm-ip>
```

### 7. SSH Hardening

Edit SSH configuration on VM:

sudo nano /etc/ssh/sshd_config


Set:

PasswordAuthentication no
PermitRootLogin no


Restart SSH:

sudo systemctl restart ssh


This enforces key-based authentication only.

### 8. Firewall Configuration

Enable UFW:

```bash
sudo ufw allow OpenSSH
sudo ufw enable
```

Check status:
```bash
sudo ufw status
```

### 9. Networking Analysis
NAT (Default)

Advantages:

Simple setup

Isolated environment

No LAN configuration needed

Limitations:

No direct LAN exposure

Port forwarding required for external access
