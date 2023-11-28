#!/bin/bash

source debian/vars.sh

set -x

mkdir -p $DEB_INSTALL_ROOT/etc/opt
mkdir -p $DEB_INSTALL_ROOT/etc/pki
mkdir -p $DEB_INSTALL_ROOT/etc/pm/config.d
mkdir -p $DEB_INSTALL_ROOT/etc/pm/power.d
mkdir -p $DEB_INSTALL_ROOT/etc/pm/sleep.d

mkdir -p $DEB_INSTALL_ROOT/etc/scl/prefixes
echo $_scl_prefix > $DEB_INSTALL_ROOT/etc/scl/prefixes/$scl_name

mkdir -p $DEB_INSTALL_ROOT/etc/skel
mkdir -p $DEB_INSTALL_ROOT/etc/sysconfig
mkdir -p $DEB_INSTALL_ROOT/etc/X11/applnk
mkdir -p $DEB_INSTALL_ROOT/etc/X11/fontpath.d
mkdir -p $DEB_INSTALL_ROOT/etc/xdg/autostart
mkdir -p $DEB_INSTALL_ROOT/etc/xinetd.d

mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/bin
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/boot
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/dev
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/etc
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/etc/opt
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/etc/pki
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/etc/pm/config.d
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/etc/pm/power.d
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/etc/pm/sleep.d
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/etc/skel
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/etc/sysconfig
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/etc/X11/applnk
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/etc/X11/fontpath.d
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/etc/xdg/autostart
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/etc/xinetd.d
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/home
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/lib
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/lib64
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/media
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/mnt
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/opt
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/proc
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/root
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/run/lock
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/sbin
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/srv
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/sys
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/tmp
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/bin
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/etc
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/games
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/include
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/lib
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/lib64
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/lib64/games
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/lib64/pm-utils/module.d
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/lib64/pm-utils/power.d
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/lib64/pm-utils/sleep.d
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/lib64/sse2
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/lib64/tls
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/lib64/X11
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/libexec
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/bin
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/etc
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/games
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/include
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/lib
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/lib64
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/libexec
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/sbin
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/share/applications
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/share/info
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/share/man/man1
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/share/man/man1x
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/share/man/man2
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/share/man/man2x
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/share/man/man3
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/share/man/man3x
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/share/man/man4
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/share/man/man4x
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/share/man/man5
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/share/man/man5x
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/share/man/man6
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/share/man/man6x
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/share/man/man7
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/share/man/man7x
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/share/man/man8
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/share/man/man8x
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/share/man/man9
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/share/man/man9x
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/share/man/mann
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/local/src
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/sbin
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/aclocal
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/applications
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/augeas/lenses
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/backgrounds
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/desktop-directories
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/dict
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/doc
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/doc/ea-php80-runtime-$version
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/empty
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/games
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/ghostscript/conf.d
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/gnome
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/icons
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/idl
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/info
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/licenses
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/locale
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/man/man1
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/man/man7
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/mime-info
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/misc
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/omf
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/pixmaps
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/sounds
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/themes
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/X11
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/xsessions
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/src/debug
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/src/kernels
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/tmp
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/var/cache
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/var/cache
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/var/tmp
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/var/tmp
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/var/adm
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/var/cache
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/var/db
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/var/empty
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/var/games
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/var/gopher
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/var/lib/games
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/var/lib/misc
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/var/lib/rpm-state
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/var/local
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/var/lock/subsys
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/var/log
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/var/mail
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/var/nis
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/var/opt
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/var/preserve
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/var/run
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/var/spool/lpd
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/var/spool/mail
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/var/tmp
mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/var/yp
mkdir -p $DEB_INSTALL_ROOT/usr/local/cpanel/whostmgr/addonfeatures

install $SOURCE3 $DEB_INSTALL_ROOT/usr/local/cpanel/whostmgr/addonfeatures/$name

mkdir -p $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/doc/ea-php80-runtime
cp ./LICENSE $DEB_INSTALL_ROOT/opt/cpanel/ea-php80/root/usr/share/doc/ea-php80-runtime

echo "FILELIST"
echo `pwd`
find . -type f -print

