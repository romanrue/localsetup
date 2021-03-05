DFLAGS="--quiet --assumeyes"

# Switch to root user
su - << EOSU

# Update PPA / Upgrade Preinstalled Packages
yum $DFLAGS update

# ..............................................................................
# Ansible Install
# ..............................................................................

# Install python3 and pip3 
yum $DFLAGS install python3.8

# Install Ansible
pip3.8 install ansible

## Configure argcomplete globally (requires bash4.2)
#yum $DFLAGS install epel-release 
#pip3 install argcomplete
#activate-global-python-argcomplete
#activate-global-python-argcomplete

# Exit root user
EOSU
