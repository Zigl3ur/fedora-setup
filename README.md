# Fedora Playbook

This playbook is a custom ansible playbook made to execute on a fresh Fedora install so it's easier for me to have a functional and operational system.

## Configuration

You can customize the playbook by mainly modifying the vars file in [`vars/vars.yml`](https://github.com/Zigl3ur/fedora-playbook/blob/main/vars/vars.yml)

## Usage

1. Install Ansible on the system if not already:

   ```bash
   sudo dnf install ansible
   ```

2. Clone the repository:

   ```bash
   git clone https://github.com/Zigl3ur/fedora-playbook.git
   cd fedora-playbook
   ```

3. Run the playbook:
   ```bash
   ansible-playbook setup.yml
   ```

## Note

Its my personnal setup, so feel free to fork and modify it as you wish.

_Btw the shell config is highly inspired (more like stolen) from the repository [firminunderscore/shell](https://github.com/firminunderscore/shell)_
