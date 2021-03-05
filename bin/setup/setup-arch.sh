DFLAGS="--noconfirm"

# Switch to root user
su - << EOSU

# Update pacman respository and packages
pacman $DFLAGS -Syu $(pacman -Qq)

# ..............................................................................
# Ansible Install
# ..............................................................................

# Install Ansible
pacman $DFLAGS -Syu ansible

# Exit root user
EOSU
