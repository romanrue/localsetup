DFLAGS="-qq -y"

# Update PPA / Upgrade Preinstalled Packages
sudo apt $DFLAGS update && sudo apt $DFLAGS upgrade 

# Install curl
sudo apt $DFLAGS install curl

# ..............................................................................
# Ansible Install
# ..............................................................................

# Install prerquisites
sudo apt $DFLAGS install software-properties-common

# Add Ansible PPA to source repositories
sudo apt-add-repository -y --update ppa:ansible/ansible

# Install Ansible
sudo apt $DFLAGS install ansible
