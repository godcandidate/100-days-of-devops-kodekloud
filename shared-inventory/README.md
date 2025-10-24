# Shared Inventory for KodeKloud App Servers on JumpHost
Common Ansible inventory for KodeKloud's 3 app servers used in all challenges.

## Files

- `inventory.ini` - Server list with connection settings
- `host_vars/` - Individual server passwords and configs

## Key Settings

- **SSH**: No host key checking (lab environment)
- **Sudo**: Password-based authentication
- **Connection**: Standard SSH with sshpass

## Install Ansible on Jumphost
- Check a simple guide to have an inventory setup for the app servers
   [Setup Repo on Jumphost](../README.md)

- Test connectivity
    ```
    ansible all -i inventory.ini -m ping
    ```


Ready to use with any KodeKloud challenge requiring Ansible automation.