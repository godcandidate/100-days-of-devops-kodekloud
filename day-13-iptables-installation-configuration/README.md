# Ansible IPtables Automation
## Overview

Automates IPtables installation and firewall configuration across multiple app servers using Ansible.

## Setup on Jump Host

1. **Create Inventory**
- Check a simple guide to have an inventory setup for the app servers
   [Shared Inventory for KodeKLound App Servers](../shared-inventory/README.md)


2. **Test connectivity**
   ```bash
   ansible all -i inventory.ini -m ping
   ```

3. **Run playbook to check Apache Health all App servers**
   ```bash
   ansible-playbook -i inventory.ini playbook.yaml
   ```


### Automation Tasks
- Installs `iptables-services` package on all servers
- Configures firewall rules to allow specific port access from load balancer
- Blocks all other traffic to the application port
- Saves rules to persist after reboot

## Key Features

- **Serial execution** - Processes one server at a time
- **Timeout protection** - Prevents hanging on slow installations
- **Idempotent** - Safe to run multiple times