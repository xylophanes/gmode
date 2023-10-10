#---------------------------------------------
#  Build gcc 32/64 bit output switching tool 
#  (C) M.A. O'Neill, Tumbling Dice, 2007-2019
#---------------------------------------------
#

ARCHFLAGS	=
CFLAGS 		=	-I. -g
LIBS		=
LDFLAGS 	=
CC		=	gcc

all:		gmode gccMultiDriver	

gmode:		gmode.o $(LIBS)
		$(CC) $(ARCHFLAGS) $(CFLAGS) $(LIBS) -o gmode gmode.c $(LDFLAGS)

gccMultiDriver:	gccMultiDriver.o $(LIBS)
		$(CC) $(ARCHFLAGS) $(CFLAGS) $(LIBS) -o gccMultiDriver gccMultiDriver.c $(LDFLAGS)

distclean:
		@rm *.o gmode gccMultiDriver

install:
		@strip gmode gccMultiDriver

		@cp gmode			/usr/bin/gmode
		@cp gmode			/usr/bin/gm32
		@cp gmode			/usr/bin/gm64
		@cp /usr/bin/gcc		/usr/bin/gcc64
		@cp /usr/bin/g++		/usr/bin/g++64
		@cp /usr/bin/gfortran		/usr/bin/gfortran64
		@cp gccMultiDriver		/usr/bin/gcc
		@cp gccMultiDriver		/usr/bin/g++
		@cp gccMultiDriver		/usr/bin/gfortran
		@cp gm32.1 			/usr/share/man/man1
		@cp gm64.1 			/usr/share/man/man1
		@cp gmode.1 			/usr/share/man/man1
		@cp gccmode.cf			/etc
	
clean:
		@rm *.o
		@rm gmode
		@rm gccMultiDriver

