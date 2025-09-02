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
   ```bash
   sudo dnf install epel-release -y
   sudo dnf install ansible -y
   ansible --version
   ```
## Usage
- Ensure you have Ansible installed on your jump host.

- Clone repo
    ```
        git clone https://github.com/godcandidate/100-days-of-devops-kodekloud.git
    ```

- Run the inventory setup command
    ```
        cd 100-days-of-devops-kodekloud
        chmod +x setup-inventory.sh
        ./setup-inventory.sh
    ```

- Test connectivity
    ```
        ansible all -i inventory.ini -m ping
    ```


Ready to use with any KodeKloud challenge requiring Ansible automation.