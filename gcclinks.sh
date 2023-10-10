#!/bin/bash
#
#-------------------------------------
# Install specified version of gcc
# (C) M.A. O'Neill, Tumbling Dice 2023
#-------------------------------------

#---------------
# Version of gcc
#---------------

version="$1"


#-------------
# Architecture
#-------------

arch=$(arch)

#-------
# Banner
#-------

echo ""
echo "    gcclink.sh version 3.00"
echo "    (C) Tumbling Dice 2023"
echo ""
echo "    Installing gnu toolchain version $version for $arch"
echo ""


#-----------------------------------
# Directory containing gnu toolchain
#-----------------------------------

pushd /usr/bin 1> /dev/null 2> /dev/null


#---------------------------------------------
# If gnu toolchain build is not versioned exit
#---------------------------------------------

nitems=$( ls -l $arch*gnu*$version* 2>/dev/null | wc -l)

if (( nitems == 0 )) ; then
	echo ""
	echo "    ERROR: cannopt find specified gnu toolchain version"
	echo ""

	exit 255
fi


#----------------------
# Remove existing links
#----------------------

\rm -rf gcc g++ gfortran gcov gcov-tool gcov-dump $arch-linux-gnu-gcc $arch-linux-gnu-g++ \
		$arch-linux-gnu-gfortran $arch-linux-gnu-gcov $arch-linux-gnu-gcov-tool $arch-linux-gnu-gcov-dump


#---------------------------------
# Make links for specified version
#---------------------------------

cp $arch-linux-gnu-gcc-$version       gcc
cp $arch-linux-gnu-g++-$version       g++
cp $arch-linux-gnu-gfortran-$version  gfortran
cp $arch-linux-gnu-gcov-$version      gcov 
cp $arch-linux-gnu-gcov-tool-$version gcov-tool 
cp $arch-linux-gnu-gcov-dump-$version gcov-dump 

cp $arch-linux-gnu-gcc-$version       $arch-linux-gnu-gcc
cp $arch-linux-gnu-g++-$version       $arch-linux-gnu-g++
cp $arch-linux-gnu-gfortran-$version  $arch-linux-gnu-gfortran
cp $arch-linux-gnu-gcov-$version      $arch-linux-gnu-gcov 
cp $arch-linux-gnu-gcov-tool-$version $arch-linux-gnu-gcov-tool 
cp $arch-linux-gnu-gcov-dump-$version $arch-linux-gnu-gcov-dump 

echo ""
echo "    done"
echo ""

exit 0
