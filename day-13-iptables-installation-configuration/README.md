# Ansible IPtables Automation
## Overview

Automates IPtables installation and firewall configuration across multiple app servers using Ansible.

## Setup on Jump Host

1. **Install Ansible**
   ```bash
   sudo dnf install epel-release -y
   sudo dnf install ansible -y
   ansible --version
   ```

2. **Prepare files**
   - Create the required file structure
   ```bash
   # Copy the files into the jumphost or clone the repo
   sudo dnf install git
   git clone 100-days-of-devops-kodekloud
   
   cd day-13-iptables-installation-configuration
    ├── host_vars/          # Server-specific variables
    │   ├── stapp01.yaml    # Variables for app server 1
    │   ├── stapp02.yaml    # Variables for app server 2  
    │   └── stapp03.yaml    # Variables for app server 3
    ├── inventory.ini       # Server list with connection details
    └── playbook.yaml       # Main automation script

      ```


   - Update `app_port` variable in playbook.yaml to match the task, current port `8089`


2. **Test connectivity**
   ```bash
   ansible all -i inventory.ini -m ping
   ```

3. **Run playbook**
   ```bash
   ansible-playbook -i inventory.ini playbook.yaml
   ```

## What it does
- `inventory.ini` - Tells Ansible which servers to connect to
- `host_vars/` - Stores unique settings for each server (passwords)
- `playbook.yaml` - Contains the automation steps to run on all servers

### Automation Tasks
- Installs `iptables-services` package on all servers
- Configures firewall rules to allow specific port access from load balancer
- Blocks all other traffic to the application port
- Saves rules to persist after reboot

## Key Features

- **Serial execution** - Processes one server at a time
- **Timeout protection** - Prevents hanging on slow installations
- **Idempotent** - Safe to run multiple times