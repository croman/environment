easy_install pip
pip install ansible

# Increase the max number max open files (suggested in the Ansible documentation)
# http://docs.ansible.com/ansible/intro_installation.html#control-machine-requirements
launchctl limit maxfiles 1024 unlimited
