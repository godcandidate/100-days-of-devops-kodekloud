# Ansible SSH Bootstrap

This Ansible automation sets up **passwordless SSH authentication** between a source server and one or more target servers.

<p align="center"> <img src="images/ssh-bootstrap.png" alt="SSH Bootstrap Architecture" width="600"> </p>

It automatically:
- Generates an SSH key pair on the source host (if none exists)
- Copies the public key to target servers
- Configures passwordless access for future automation or administration

---

## Features
- Works across multiple target servers
- Customizable usernames and passwords for source and targets
- Idempotent: safely re-runnable
- Simple inventory and variable structure

---

## Project Structure

```

ansible-ssh-bootstrap/
├── inventory.ini
├── playbook.yml
└── README.md

```

---

##  Usage

1. **Folder Setup**

- Check a simple guide to setup this folder
   [Setup Repo on Jumphost - Option 2](../README.md)


2. **Edit the inventory**

- Define your source and target servers in `inventory`:

   ```ini
   [source]
   source_host ansible_host=source_ip ansible_user=source_user ansible_password=source_password

   [targets]
   target1 ansible_host=target_ip ansible_user=target_user ansible_password=target_password
   ```

- Test connectivity
    ```
    ansible all -i inventory.ini -m ping
    ```


3. **Run the playbook**

   ```bash
   ansible-playbook -i inventory.ini playbook.yaml
   ```

---

## What It Does

1. Checks for an existing SSH key on the source server (creates one if missing)
2. Collects the public key
3. Copies the key to each target host
4. Verifies passwordless SSH connectivity

---

##  Notes

* Ensure all hosts are reachable over SSH.
* Use temporary passwords for initial setup; they won’t be needed afterward.
* After setup, you can disable password authentication for tighter security.

---


