WGETFLAGS="--no-check-certificate"
FOLDERFLAGS='--recursive --no-parent --no-directories --reject="index.html*"'

# ------------------------------------------------------------------------------
# Functions
# ------------------------------------------------------------------------------

# Execute a slackbuild from index folder in mirror
#	$1:	/link/to/index
slackbuild_folder()
{
	DEST="$(basename "$1")"
	wget "$WGETFLAGS" "$FOLDERFLAGS" -P "$DEST" "$1"
	SLACKBIN="$DEST"/"${DEST}.SlackBuild"
	chmod u+x "$SLACKBIN"
	./"$SLACKBIN"
	# Cleanup
	rm -r "$DEST"
}
 
# Install remote binary package
#       $1:     /link/to/binary
packageinstall()
{
        wget $WGETFLAGS "$1"
        LOCALBIN="$(basename "$1")"
        upgradepkg --install-new "$LOCALBIN"
        # Cleanup
        rm "$LOCALBIN"
}

su -l << EOSU

#slackbuild_folder "https://mirrors.slackware.com/slackware/slackware-14.2/source/d/gcc/"
                                                                                                                                                               # Install prerequisites                                                                                                                                        packageinstall "http://slackware.cs.utah.edu/pub/slackware/slackware64-14.2/patches/packages/rsync-3.1.3-x86_64-1_slack14.2.txz"                                                                                                                                                                                              # Install package manager                                                                                                                                      packageinstall "https://github.com/sbopkg/sbopkg/releases/download/0.38.1/sbopkg-0.38.1-noarch-1_wsr.tgz"# Switch to root user

## Update Gentoo repository
#emerge $DFLAGS --sync
#
## Update to latest kernel
#emerge $DFLAGS --deep --newuse --update @system
#
## Update all packages
#emerge $DFLAGS --deep --newuse --update --with-bdeps=y @world
#
## Clean up libraries with no other dependencies
#emerge $DFLAGS --depclean
#
## Install gentoo utilities
#emerge $DFLAGS --deep --newuse --update gentoolkit
#
## Fix dynamic and static linking problems
#revdep-rebuild
#
## Automatically merge all updates (starts prompt for every update)
#etc-update --automode -3
#
## ..............................................................................
## Ansible Install
## ..............................................................................
#
## Install Ansible
#emerge $DFLAGS --deep --newuse --update --autounmask app-admin/ansible
#
## Fix dynamic and static linking problems
#revdep-rebuild

# Exit root user
EOSU
