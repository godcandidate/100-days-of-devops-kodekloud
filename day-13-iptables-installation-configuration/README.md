# Ansible IPtables Automation
Automates IPtables installation and firewall configuration across multiple app servers using Ansible.

## Setup on Jump Host

1. **Create Inventory**
- Check a simple guide to have an inventory setup for the app servers
   [Shared Inventory for KodeKLound App Servers](../shared-inventory/README.md)


2. **Run playbook**
- Copy the playbook.yaml in your ansible directory

- Update `app_port` variable in playbook.yaml to match the task, current port `5000`

- Test your playbook
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