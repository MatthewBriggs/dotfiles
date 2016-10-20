#!/bin/bash

USER="matt"
ABSLOCATION="/var/abs/"
BUILDLOCATION="/tmp/mspacman"
PACKAGES=`ls /home/$USER/.scripts/mspacman.conf/`
PKGCONFIGLOC="/home/matt/.scripts/mspacman.conf/"

find_abs_location (){
	PACKAGELOCATION=`find $ABSLOCATION/testing -name $1`
	
	if [ "$PACKAGELOCATION" == "" ]; then
		PACKAGELOCATION=`find $ABSLOCATION -name $1` 
	fi
}

which_repo (){
	find_abs_location $1
	echo $PACKAGELOCATION
}

new_package (){
	if [[ -d $PKGCONFIGLOC/$1 ]]; then
		echo ""
	else
		mkdir -p $PKGCONFIGLOC/$1
	fi
	
	find_abs_location $1
	
	cp -R $PACKAGELOCATION/PKGBUILD $PKGCONFIGLOC/$1
	
	echo ":: Time to edit the package with $EDITOR"
	sleep 1
	
	echo "groups=('modified')" >> $PKGCONFIGLOC/$1/PKGBUILD

	$EDITOR $PKGCONFIGLOC/$1/PKGBUILD
	echo $2
	if [[ $2 == "build" ]]; then
		build_package $1
	else 
		echo "nothing to do!"
	fi
}

build_package(){
	find_abs_location $1

	cp -R $PACKAGELOCATION $BUILDLOCATION/$1
	rm -rf $BUILDLOCATION/$1/PKGBUILD
	cp -R $PKGCONFIGLOC/$1/PKGBUILD $BUILDLOCATION/$1

	cd $BUILDLOCATION/$1

	makepkg -s -i --skippgpcheck
}

#rebuild_all(){

#}

show_help(){

	echo "usage:  mspacman <operation> [...]"
	echo "operations:"
	echo "    mspacman {-n} <package>"
	echo "    mspacman {-h --help}"
	echo "    mspacman {-V --version}"
	echo ""
}

version(){
	echo ""
	echo "  |><|"
	echo "  .--.                  MsPacman v2.0"
	echo " / _.-' .-.  .-.  .-.   "
	echo " \  '-. '-'  '-'  '-'   This program may be freely redistributed under"
	echo "  '--'                  the terms of the GNU General Public License."
	echo ""

							
}
	
#check to see if abs is installed, if not install and sync
#run abs if not done in more than 6 hours

case "$1" in
	-n) new_package $2 build
	;;
	-r) build_package $2
	;;
	--which-repo) which_repo $2
	;;
	-h) show_help
	;;
	--pkgbuild-only) new_package $2 
	;;
	-a) rebuild_all
	;;
	-V) version
	;;
	*) echo "arguments please :-)"

esac

exit 0	
