#!/bin/sh
# check_lfs_simple.sh — Vérification simple des paquets LFS
# Format: "Nom => OK" ou "Nom => KO"

ok() { printf "%s => OK\n" "$1"; }
ko() { printf "%s => KO\n" "$1"; FAIL=$((FAIL+1)); }
have() { command -v "$1" >/dev/null 2>&1; }

FAIL=0

# Acl
if have setfacl; then ok "Acl"; else ko "Acl"; fi
# Attr
if have getfattr; then ok "Attr"; else ko "Attr"; fi
# Autoconf
if have autoconf; then ok "Autoconf"; else ko "Autoconf"; fi
# Automake
if have automake; then ok "Automake"; else ko "Automake"; fi
# Bash
if have bash; then ok "Bash"; else ko "Bash"; fi
# Bc
if have bc; then ok "Bc"; else ko "Bc"; fi
# Binutils
if have ld; then ok "Binutils"; else ko "Binutils"; fi
# Bison
if have bison; then ok "Bison"; else ko "Bison"; fi
# Bzip2
if have bzip2; then ok "Bzip2"; else ko "Bzip2"; fi
# Check
if have pkg-config && pkg-config --exists check 2>/dev/null; then ok "Check"; else ko "Check"; fi
# Coreutils
if have ls; then ok "Coreutils"; else ko "Coreutils"; fi
# DejaGNU
if have runtest; then ok "DejaGNU"; else ko "DejaGNU"; fi
# Diffutils
if have diff; then ok "Diffutils"; else ko "Diffutils"; fi
# Eudev
if have udevadm; then ok "Eudev"; else ko "Eudev"; fi
# E2fsprogs
if have mke2fs; then ok "E2fsprogs"; else ko "E2fsprogs"; fi
# Expat
if have pkg-config && pkg-config --exists expat 2>/dev/null; then ok "Expat"; else ko "Expat"; fi
# Expect
if have expect; then ok "Expect"; else ko "Expect"; fi
# File
if have file; then ok "File"; else ko "File"; fi
# Findutils
if have find; then ok "Findutils"; else ko "Findutils"; fi
# Flex
if have flex; then ok "Flex"; else ko "Flex"; fi
# Gawk
if have gawk; then ok "Gawk"; else ko "Gawk"; fi
# GCC
if have gcc; then ok "GCC"; else ko "GCC"; fi
# GDBM
if have pkg-config && pkg-config --exists gdbm 2>/dev/null; then ok "GDBM"; else ko "GDBM"; fi
# Gettext
if have gettext; then ok "Gettext"; else ko "Gettext"; fi
# Glibc
if have ldd; then ok "Glibc"; else ko "Glibc"; fi
# GMP
if have pkg-config && pkg-config --exists gmp 2>/dev/null; then ok "GMP"; else ko "GMP"; fi
# Gperf
if have gperf; then ok "Gperf"; else ko "Gperf"; fi
# Grep
if have grep; then ok "Grep"; else ko "Grep"; fi
# Groff
if have groff; then ok "Groff"; else ko "Groff"; fi
# GRUB
if have grub-install; then ok "GRUB"; else ko "GRUB"; fi
# Gzip
if have gzip; then ok "Gzip"; else ko "Gzip"; fi
# Iana-Etc
if [ -f /etc/protocols ] && [ -f /etc/services ]; then ok "Iana-Etc"; else ko "Iana-Etc"; fi
# Inetutils
if have hostname; then ok "Inetutils"; else ko "Inetutils"; fi
# Intltool
if have intltoolize; then ok "Intltool"; else ko "Intltool"; fi
# IPRoute2
if have ip; then ok "IPRoute2"; else ko "IPRoute2"; fi
# Kbd
if have loadkeys; then ok "Kbd"; else ko "Kbd"; fi
# Kmod
if have kmod; then ok "Kmod"; else ko "Kmod"; fi
# Less
if have less; then ok "Less"; else ko "Less"; fi
# Libcap
if have getcap; then ok "Libcap"; else ko "Libcap"; fi
# Libpipeline
if have pkg-config && pkg-config --exists libpipeline 2>/dev/null; then ok "Libpipeline"; else ko "Libpipeline"; fi
# Libtool
if have libtool; then ok "Libtool"; else ko "Libtool"; fi
# M4
if have m4; then ok "M4"; else ko "M4"; fi
# Make
if have make; then ok "Make"; else ko "Make"; fi
# Man-DB
if have man; then ok "Man-DB"; else ko "Man-DB"; fi
# Man-pages
if [ -f /usr/share/man/man2/open.2 ] || [ -f /usr/share/man/man2/open.2.gz ]; then ok "Man-pages"; else ko "Man-pages"; fi
# MPC
if have pkg-config && pkg-config --exists mpc 2>/dev/null; then ok "MPC"; else ko "MPC"; fi
# MPFR
if have pkg-config && pkg-config --exists mpfr 2>/dev/null; then ok "MPFR"; else ko "MPFR"; fi
# Ncurses
if (have pkg-config && pkg-config --exists ncursesw 2>/dev/null) || (have pkg-config && pkg-config --exists ncurses 2>/dev/null); then ok "Ncurses"; else ko "Ncurses"; fi
# Patch
if have patch; then ok "Patch"; else ko "Patch"; fi
# Perl
if have perl; then ok "Perl"; else ko "Perl"; fi
# Pkg-config
if have pkg-config; then ok "Pkg-config"; else ko "Pkg-config"; fi
# Procps
if have ps; then ok "Procps"; else ko "Procps"; fi
# Psmisc
if have killall; then ok "Psmisc"; else ko "Psmisc"; fi
# Readline
if have pkg-config && pkg-config --exists readline 2>/dev/null; then ok "Readline"; else ko "Readline"; fi
# Sed
if have sed; then ok "Sed"; else ko "Sed"; fi
# Shadow
if have login && have useradd; then ok "Shadow"; else ko "Shadow"; fi
# Sysklogd
if have syslogd; then ok "Sysklogd"; else ko "Sysklogd"; fi
# Sysvinit
if [ -x /sbin/init ]; then ok "Sysvinit"; else ko "Sysvinit"; fi
# Tar
if have tar; then ok "Tar"; else ko "Tar"; fi
# Tcl
if have tclsh; then ok "Tcl"; else ko "Tcl"; fi
# Texinfo
if have makeinfo; then ok "Texinfo"; else ko "Texinfo"; fi
# Time Zone Data
if [ -f /usr/share/zoneinfo/UTC ]; then ok "Time Zone Data"; else ko "Time Zone Data"; fi
# Udev-lfs Tarball
if [ -d /etc/udev/rules.d ] || [ -d /usr/lib/udev/rules.d ]; then ok "Udev-lfs Tarball"; else ko "Udev-lfs Tarball"; fi
# Util-linux
if have lsblk; then ok "Util-linux"; else ko "Util-linux"; fi
# Vim
if have vim; then ok "Vim"; else ko "Vim"; fi
# XML::Parser
if have perl && perl -MXML::Parser -e 'exit 0' >/dev/null 2>&1; then ok "XML::Parser"; else ko "XML::Parser"; fi
# Xz Utils
if have xz; then ok "Xz Utils"; else ko "Xz Utils"; fi
# Zlib
if have pkg-config && pkg-config --exists zlib 2>/dev/null; then ok "Zlib"; else ko "Zlib"; fi

exit "$FAIL"
