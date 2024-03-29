## Gmode

Utility to transparently switch gcc between 32 bit and 64 bit output modes on x86_64
and aarch compliant archtitectures.
<br>
<br>
##### To enable gmode

Type (after building gcc from source) type:
./install.csh

This will also install gmode tools (in /bin) and man pages (in /usr/share/man)
<br>
<br>
##### To disable gmode

Type:
./uninstall (rturns gcc to default build settings)

This will also uninstall gmode tools and man pages.
<br>
<br>
##### 32 bit mode

Type:
gm32
<br>
<br>
##### 64 bit mode

Type:
gm64
<br>
<br>
##### Show current mode

Type:
gmode
<br>
<br>
<br>
## gcclinks.sh

This is an additional (script) based tool to switch between gcc compiler versions (typically on Debian derived Linux
distributions). To switch to gcc-12 (for example), assuming gcc-12 has been built from sources of installed from an
appropriate repository type:

./gcclinks 12

This will set up links so gcc/g++ (and support tools) point to the specified gcc compiler (gcc-12).

This tool must be applied before intialising gmode (on x86_64 and aarch64 architectures).
