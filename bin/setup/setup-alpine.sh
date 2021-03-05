DFLAGS="--quiet"

# Switch to root user
su - << EOSU

# Update apk respository and packages
apk $DFLAGS update && apk $DFLAGS upgrade

# ..............................................................................
# Ansible Install
# ..............................................................................

# Install Ansible
apk $DFLAGS add ansible

# Exit root user
EOSU
