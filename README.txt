gEDA wrapper apps for Mac OS X
==============================

These are Mac OS X .app launchers for the gEDA applications.
They should work on OS X 10.5 and later.
Simply drag them into /Applications.

These .apps create file associations.
For example, double-clicking an .sch file in Finder opens it in gschem.
Files can also be opened by dropping them onto the app icons.

The gEDA programs themselves are NOT included in the .app files.
They must be installed separately from source or via MacPorts.

By default, the launchers assume the executables are in /opt/local/bin
(the default MacPorts directory).
The executable paths can be changed using the "defaults write" command in Terminal.
To change the path to gschem, for example, use the following command:

defaults write org.gpleda.gschem path /newpath/gschem

where "/newpath/gschem" is the full path to the gschem executable.
Use the following bundle identifiers for the other applications:

org.gpleda.pcb (for pcb)
org.gpleda.gerbv (for gerbv)
org.gpleda.gsch2pcb (for xgsch2pcb)


* gerbv note:
Selecting multiple Gerber files in Finder and opening them will open
each file in a SEPARATE WINDOW. There is no simple way to fix this.
However, the gerbv app will open .gvp project files.

Matt Sarnoff (www.msarnoff.org)
May 31, 2010