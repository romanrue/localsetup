DFLAGS="--verbose"

# Switch to root user
su - << EOSU

# Update Gentoo repository
emerge $DFLAGS --sync

# Update to latest kernel
emerge $DFLAGS --deep --newuse --update @system

# Update all packages
emerge $DFLAGS --deep --newuse --update --with-bdeps=y @world

# Clean up libraries with no other dependencies
emerge $DFLAGS --depclean

# Install gentoo utilities
emerge $DFLAGS --deep --newuse --update gentoolkit

# Fix dynamic and static linking problems
revdep-rebuild

# Automatically merge all updates (starts prompt for every update)
etc-update --automode -3

# ..............................................................................
# Ansible Install
# ..............................................................................

# Install Ansible
emerge $DFLAGS --deep --newuse --update --autounmask app-admin/ansible

# Fix dynamic and static linking problems
revdep-rebuild

# Exit root user
EOSU
