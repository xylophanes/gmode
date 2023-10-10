#!/bin/bash
#
#---------------------------------------------
#  gmode utilities de-installation tool
#  (C) M.A. O'Neill, Tumbling Dice, 2007-2019
#---------------------------------------------
#

binDir=/usr/bin
manDir=/usr/share/man

echo ""
echo "    gmode utilities de-installation tool (version 2.00)"
echo "    (C) M.A. O'Neill, Tumbling Dice, 2019"
echo ""


if [ $(arch) != x86_64 ] && [ $(arch) != aarch64 ] ;  then
	echo ""
        echo "    install ERROR: architecture is not x86_64 or aarch64"
        echo ""

        exit 255 
fi

if [ ! -e $binDir/GMODE_INSTALLED ] ; then
	echo ""
	echo "    uninstall ERROR: gmode utilities are not installed"
	echo ""

	exit 255 
fi

echo ""
echo "    .. removing gmode binaries"
\rmdir $binDir/GMODE_INSTALLED
\rm $binDir/gm32			>& /dev/null
\rm $binDir/gm64			>& /dev/null
\rm $binDir/gmode			>& /dev/null

echo "    .. removing gmode man pages"
\rm $manDir/man/gm32.1			>& /dev/null
\rm $manDir/man/gm64.1			>& /dev/null

echo "    .. removing gmode control files"
\rm /etc/gccmode.cf			>& /dev/null

echo "    ... Restoring default gcc environment"
\mv $binDir/gcc64 $binDir/gcc		>& /dev/null
\mv $binDir/g++64 $binDir/g++		>& /dev/null
\mv $binDir/gfortran64 $binDir/gfortran	>& /dev/null
\mv $binDir/gcj64 $binDir/gcj		>& /dev/null

echo ""
echo "    Finished"
echo ""

exit 0

