#!/bin/bash

PACKAGE_NAME=`echo $PWD | rev | cut -d '/' -f1 | rev`

echo $PACKAGE_NAME

if [[ ! -z "$1" ]]; then
	$1
else
	./configure --prefix=/usr
fi

make -j5 

make install DESTDIR=$(pwd)/PACKAGE

cd PACKAGE

mkdir -p var/log/packages

ls  -R $PWD | awk '/:$/&&f{s=$0;f=0}/:$/&&!f{sub(/:$/,"");s=$0;f=1;next}NF&&f{ print s"/"$0 }' > var/log/packages/$PACKAGE_NAME

sed -i "s:/sources/$PACKAGE_NAME/PACKAGE::g" var/log/packages/$PACKAGE_NAME

#less var/log/packages/ncdu-1.12 | grep -Fxvf /etc/pm/blacklist > var/log/packages/$PACKAGE_NAME.grep

#rm var/log/packages/$PACKAGE_NAME

#mv var/log/packages/$PACKAGE_NAME.grep var/log/packages/$PACKAGE_NAME

tar -czvf $PACKAGE_NAME.tar.gz *

# package to be moved to another location

tar -xvf $PACKAGE_NAME.tar.gz -C /
