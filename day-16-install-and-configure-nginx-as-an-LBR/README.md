# Ansible  httpd health Check on App Servers
 httpd health Check on App Servers configuration across multiple app servers using Ansible.

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


## Troubleshoot Apache Issue with Automation

This playbook:
- Checks if Apache (httpd) is installed
- Verifies if the Apache service is running
- Finds the port Apache is listening on
- Sends a test request to confirm the server is responding
- Reports status with port number and HTTP response

## Config nginx as a load balancer

Configure nginx on the load balancer server:
- Install nginx
- Start and enable the nginx server
- Update nginx config, the http block with `nginx.conf` file
- Replace the port with port discovered in playbook results

