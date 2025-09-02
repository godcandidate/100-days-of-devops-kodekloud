# Ansible  Configure App Servers for WordPress
Configure App Servers for WordPress across multiple app servers using Ansible.

## Setup 

1. **Create Inventory**
- Check a simple guide to have an inventory setup for the app servers
   [Shared Inventory for KodeKLound App Servers](../shared-inventory/README.md)


2. **Create playbook files**
- Copy the playbook.yaml in your ansible directory

## Run Playbooks
1. **Troubleshoot**
   ```bash
   ansible-playbook -i inventory.ini playbook.yaml
   ```


## Install apache and php Issue with Automation

This playbook:
- Installs Apache (httpd) and required PHP packages
- Backs up the default Apache config
- Changes Apache’s listening port to 5000
- Starts and enables the Apache service
- Ensures the web root directory (/var/www/html) exists and not empty

## Config MariaDB
Install and Configure MariaDB Server on DB Server
- Install mariadb in database server
- Start mariadb service
- Check app link


