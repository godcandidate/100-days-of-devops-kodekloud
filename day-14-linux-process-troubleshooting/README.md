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
   
   cd day-14-linux-process-troubleshooting
    ├── host_vars/          # Server-specific variables
    │   ├── stapp01.yaml    # Variables for app server 1
    │   ├── stapp02.yaml    # Variables for app server 2  
    │   └── stapp03.yaml    # Variables for app server 3
    ├── inventory.ini       # Server list with connection details
    └── troubleshoot_apache.yaml       # Main troubleshoot script
    └── fix_apache.yaml       # Main fix script

      ```


   - Update `app_port` variable in playbook.yaml to match the task, current port `5000`


2. **Test connectivity**
   ```bash
   ansible all -i inventory.ini -m ping
   ```
   # check which servers have the apache active
   ansible -i inventory.ini all -a "systemctl is-active httpd"


3. **Troubleshoot**
   ```bash
   ansible-playbook -i inventory.ini troubleshoot_apache.yaml
   ```

   - found out httpd service status is failed on 'App Server 1`

4. **Fix**
   ```bash
   ansible-playbook -i inventory.ini fix_apache.yaml
   ```

   - found out httpd service status is failed on 'App Server 1`


### Troubleshoot Apache Issue with Automation

The troubleshooting playbook automatically:
- Checks Apache service status on all servers
- Identifies which server has the failed service
- Gathers error logs and configuration details
- Reports findings for quick problem identification

### Fix Apache Issue with Automation

The fix playbook automatically:
- Stops any conflicting processes using the target port
- Corrects Apache configuration if needed
- Restarts the Apache service
- Verifies the service is running and accessible

