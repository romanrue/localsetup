# Switch to root user
su - << EOSU

# ..............................................................................
# Ansible Install
# ..............................................................................

# Install sysadmin bundle that includes Ansible
swupd bundle-add sysadmin-hostmgmt

# Update Software
swupd update

# Exit root user
EOSU
