DFLAGS="-qq -y"

# Switch to root user
su - << EOSU

# Update PPA / Upgrade Preinstalled Packages
apt $DFLAGS update && apt $DFLAGS upgrade 

# Install curl
apt $DFLAGS install curl

# ..............................................................................
# Ansible Install
# ..............................................................................

# Install prerquisites
apt $DFLAGS install gnupg

# Add Ansible PPA to source repositories
ANSPPASTR="deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main"
APTSRCS="/etc/apt/sources.list"
grep -qxF "${ANSPPASTR}" "${APTSRCS}" || echo "${ANSPPASTR}" >> "${APTSRCS}"
apt-key adv --keyserver keyserver.ubuntu.com -recv-keys 93C4A3FD7BB9C367
apt $DFLAGS update

# Install Ansible
apt $DFLAGS install ansible

# Exit root user
EOSU
