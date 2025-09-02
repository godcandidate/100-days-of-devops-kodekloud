# Ansible IPtables Automation
## Overview

Automates IPtables installation and firewall configuration across multiple app servers using Ansible.

## Setup on Jump Host

1. **Create Inventory**
- Check a simple guide to have an inventory setup for the app servers
   [Shared Inventory for KodeKLound App Servers](../shared-inventory/README.md)


2. **Create playbook files**
- Copy the playbook files(fix_apache.yaml, troubleshoot_apache.yaml) in your ansible directory

- Update `app_port` variable in playbook files to match the task, current port `8083`


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

