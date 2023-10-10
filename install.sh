#!/bin/bash
#
#---------------------------------------------------------------------------------
# Install script for gmode utilities
# (C) M.A. O'Neill 25/09/2019 
#
# If $1 is 'noinstall' just compile (don't install)
# If $1 is 'force' force installation
#---------------------------------------------------------------------------------
#

echo ""
echo "    gmode installation script (version 2.00)"
echo "    (C) M.A. O'Neill, Tumbling Dice, 2007-2019"
echo ""


#--------------------
# Check architecture
#--------------------

arch=$(arch)
arch=$(upcase $arch)

if [ $arch != X86_64 ] && [ $arch != AARCH64 ] ; then
	echo ""
	echo "    install ERROR: wrong architecture [$(arch)]"
	echo ""

	exit 255 
fi


#------------------
# Binary directory
#------------------

binDir=/usr/bin

if [ "$1" != noinstall ] ; then
	if [ "$1" != force ]  &&  [ -e $binDir/GMODE_INSTALLED ] ; then
		echo ""
		echo "    install ERROR: gmode tools are already installed"
		echo ""

		exit 255 
	else
		mkdir $binDir/GMODE_INSTALLED	>& /dev/null
	fi

	if [ $(whoami) != root ] ; then
		echo ""
		echo "    install ERROR: you are not root -- go away!"
		echo ""

		exit 255 
	fi	
fi


#-------------------
# Build gmode tools
#-------------------

echo "    ... Building gmode utility"
echo ""

sed "s|BINDIR|$binDir|g" < gmode.c.in	      	> gmode.c
sed "s|BINDIR|$binDir|g" < gccMultiDriver.c.in	> gccMultiDriver.c

if [ "$1" = noinstall ] ; then
	make clean; make ARCHFLAGS="-D$arch"
	#set path=($path .)
else
	pushd /usr/bin				>& /dev/null
	if [ -e gcc64 ] ; then
		\mv gcc64 gcc			>& /dev/null
        fi	

	if [ -e g++64 ] ; then
		\mv g++64 g++ 			>& /dev/null
	fi

	if [ -e gfortran64 ] ;  then
		\mv gfortran64 gfortran		>& /dev/null
	fi	

	if [ -e gcj64 ] ; then
		\mv gcj64 gcj			>& /dev/null
	fi
	popd					>& /dev/null

	make ARCHFLAGS="-D$arch"; make install; make clean
	\rm gmode.c gccMultiDriver.c		>& /dev/null
fi


#-----------
# Run tests
#-----------

echo ""
echo "    ... Testing gcc (test.c)"
gm64
gcc -o test test.c
./test
gm32
gcc -o test test.c
./test

echo ""
echo "    ... Testing g++ (test.C)"
gm64
g++ -o test test.C 
./test
gm32
g++ -o test test.C
./test

echo ""
echo "    ... Testing gfortran (test.f)"
gm64
gfortran -o test test.f
./test
gm32
gfortran -o test test.f
./test

\rm ./test

#------------------------------------
# Switch to 64 bit mode post testing
#------------------------------------

gm64

echo ""
echo "    install: Finished"
echo ""

exit 0

