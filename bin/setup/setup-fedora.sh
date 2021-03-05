DFLAGS="--quiet --assumeyes"

# Switch to root user
su - << EOSU

# Update PPA / Upgrade Preinstalled Packages
dnf $DFLAGS update

# ..............................................................................
# Ansible Install
# ..............................................................................

# Install Ansible
dnf $DFLAGS install ansible

## Configure argcomplete globally (requires bash4.2)
#dnf $DFLAGS install python-argcomplete

# Exit root user
EOSU
