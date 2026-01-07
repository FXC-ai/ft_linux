#!/bin/sh
# check_lfs_pkgs.sh — Vérification rapide des paquets LFS
# Affiche OK/KO + une info (version / chemin / fichier).

ok()  { printf "✅ %-14s %s\n" "$1" "$2"; }
ko()  { printf "❌ %-14s %s\n" "$1" "$2"; FAIL=$((FAIL+1)); }
hdr() { printf "\n== %s ==\n" "$1"; }

have() { command -v "$1" >/dev/null 2>&1; }

ver_head1() { "$@" 2>&1 | head -n 1; }

FAIL=0

hdr "Outils / binaires"
# Acl
if have setfacl; then ok "Acl" "$(ver_head1 setfacl --version)"; else ko "Acl" "setfacl absent"; fi
# Attr
if have getfattr; then ok "Attr" "$(ver_head1 getfattr --version)"; else ko "Attr" "getfattr absent"; fi
# Autoconf
if have autoconf; then ok "Autoconf" "$(ver_head1 autoconf --version)"; else ko "Autoconf" "autoconf absent"; fi
# Automake
if have automake; then ok "Automake" "$(ver_head1 automake --version)"; else ko "Automake" "automake absent"; fi
# Bash
if have bash; then ok "Bash" "$(ver_head1 bash --version)"; else ko "Bash" "bash absent"; fi
# Bc
if have bc; then ok "Bc" "$(ver_head1 bc --version)"; else ko "Bc" "bc absent"; fi
# Binutils
if have ld; then ok "Binutils" "$(ver_head1 ld --version)"; else ko "Binutils" "ld absent"; fi
# Bison
if have bison; then ok "Bison" "$(ver_head1 bison --version)"; else ko "Bison" "bison absent"; fi
# Bzip2
if have bzip2; then ok "Bzip2" "$(ver_head1 bzip2 --version)"; else ko "Bzip2" "bzip2 absent"; fi
# Coreutils
if have ls; then ok "Coreutils" "$(ver_head1 ls --version)"; else ko "Coreutils" "ls absent"; fi
# DejaGNU
if have runtest; then ok "DejaGNU" "$(ver_head1 runtest --version)"; else ko "DejaGNU" "runtest absent"; fi
# Diffutils
if have diff; then ok "Diffutils" "$(ver_head1 diff --version)"; else ko "Diffutils" "diff absent"; fi
# Eudev
if have udevadm; then ok "Eudev" "$(udevadm --version 2>/dev/null || echo 'udevadm présent')"; else ko "Eudev" "udevadm absent"; fi
# E2fsprogs
if have mke2fs; then ok "E2fsprogs" "$(mke2fs -V 2>&1 | head -n 1)"; else ko "E2fsprogs" "mke2fs absent"; fi
# Expect
if have expect; then ok "Expect" "$(expect -v 2>&1 | head -n 1)"; else ko "Expect" "expect absent"; fi
# File
if have file; then ok "File" "$(file --version 2>&1 | head -n 1)"; else ko "File" "file absent"; fi
# Findutils
if have find; then ok "Findutils" "$(ver_head1 find --version)"; else ko "Findutils" "find absent"; fi
# Flex
if have flex; then ok "Flex" "$(flex --version 2>&1 | head -n 1)"; else ko "Flex" "flex absent"; fi
# Gawk
if have gawk; then ok "Gawk" "$(ver_head1 gawk --version)"; else ko "Gawk" "gawk absent"; fi
# GCC
if have gcc; then ok "GCC" "$(ver_head1 gcc --version)"; else ko "GCC" "gcc absent"; fi
# Gettext
if have gettext; then ok "Gettext" "$(ver_head1 gettext --version)"; else ko "Gettext" "gettext absent"; fi
# Gperf
if have gperf; then ok "Gperf" "$(ver_head1 gperf --version)"; else ko "Gperf" "gperf absent"; fi
# Grep
if have grep; then ok "Grep" "$(ver_head1 grep --version)"; else ko "Grep" "grep absent"; fi
# Groff
if have groff; then ok "Groff" "$(ver_head1 groff --version)"; else ko "Groff" "groff absent"; fi
# GRUB
if have grub-install; then ok "GRUB" "$(grub-install --version 2>&1 | head -n 1)"; else ko "GRUB" "grub-install absent"; fi
# Gzip
if have gzip; then ok "Gzip" "$(ver_head1 gzip --version)"; else ko "Gzip" "gzip absent"; fi
# Inetutils
if have hostname; then ok "Inetutils" "$(hostname --version 2>&1 | head -n 1)"; else ko "Inetutils" "hostname absent"; fi
# Intltool
if have intltoolize; then ok "Intltool" "$(intltoolize --version 2>&1 | head -n 1)"; else ko "Intltool" "intltoolize absent"; fi
# IPRoute2
if have ip; then ok "IPRoute2" "$(ip -V 2>&1 | head -n 1)"; else ko "IPRoute2" "ip absent"; fi
# Kbd
if have loadkeys; then ok "Kbd" "$(loadkeys --version 2>&1 | head -n 1)"; else ko "Kbd" "loadkeys absent"; fi
# Kmod
if have kmod; then ok "Kmod" "$(kmod --version 2>&1 | head -n 1)"; else ko "Kmod" "kmod absent"; fi
# Less
if have less; then ok "Less" "$(less --version 2>&1 | head -n 1)"; else ko "Less" "less absent"; fi
# Libcap
if have getcap; then ok "Libcap" "$(getcap -v 2>&1 | head -n 1)"; else ko "Libcap" "getcap absent"; fi
# Libtool
if have libtool; then ok "Libtool" "$(libtool --version 2>&1 | head -n 1)"; else ko "Libtool" "libtool absent"; fi
# M4
if have m4; then ok "M4" "$(ver_head1 m4 --version)"; else ko "M4" "m4 absent"; fi
# Make
if have make; then ok "Make" "$(ver_head1 make --version)"; else ko "Make" "make absent"; fi
# Man-DB
if have man; then ok "Man-DB" "$(man --version 2>&1 | head -n 1)"; else ko "Man-DB" "man absent"; fi
# Patch
if have patch; then ok "Patch" "$(ver_head1 patch --version)"; else ko "Patch" "patch absent"; fi
# Perl
if have perl; then ok "Perl" "$(perl -v 2>&1 | head -n 2 | tail -n 1)"; else ko "Perl" "perl absent"; fi
# Pkg-config
if have pkg-config; then ok "Pkg-config" "$(pkg-config --version 2>&1 | head -n 1)"; else ko "Pkg-config" "pkg-config absent"; fi
# Procps
if have ps; then ok "Procps" "$(ps --version 2>&1 | head -n 1)"; else ko "Procps" "ps absent"; fi
# Psmisc
if have killall; then ok "Psmisc" "$(killall --version 2>&1 | head -n 1)"; else ko "Psmisc" "killall absent"; fi
# Sed
if have sed; then ok "Sed" "$(ver_head1 sed --version)"; else ko "Sed" "sed absent"; fi
# Shadow
if have login && have useradd; then ok "Shadow" "login + useradd présents"; else ko "Shadow" "login et/ou useradd absent"; fi
# Sysklogd
if have syslogd; then ok "Sysklogd" "$(syslogd -v 2>&1 | head -n 1)"; else ko "Sysklogd" "syslogd absent"; fi
# Sysvinit (sur LFS sysvinit : /sbin/init --version ; sinon fallback PID 1)
if [ -x /sbin/init ]; then
  v=$(/sbin/init --version 2>/dev/null | head -n 1)
  [ -n "$v" ] && ok "Sysvinit" "$v" || ok "Sysvinit" "init présent (PID1=$(ps -p 1 -o comm= 2>/dev/null))"
else
  ko "Sysvinit" "/sbin/init absent"
fi
# Tar
if have tar; then ok "Tar" "$(ver_head1 tar --version)"; else ko "Tar" "tar absent"; fi
# Tcl
if have tclsh; then ok "Tcl" "$(tclsh <<< 'puts [info patchlevel]' 2>/dev/null | head -n 1)"; else ko "Tcl" "tclsh absent"; fi
# Texinfo
if have makeinfo; then ok "Texinfo" "$(ver_head1 makeinfo --version)"; else ko "Texinfo" "makeinfo absent"; fi
# Util-linux
if have lsblk; then ok "Util-linux" "$(lsblk --version 2>&1 | head -n 1)"; else ko "Util-linux" "lsblk absent"; fi
# Vim
if have vim; then ok "Vim" "$(vim --version 2>&1 | head -n 1)"; else ko "Vim" "vim absent"; fi
# Xz Utils
if have xz; then ok "Xz" "$(xz --version 2>&1 | head -n 1)"; else ko "Xz" "xz absent"; fi

hdr "Libs / modules (via pkg-config ou perl)"
if have pkg-config; then
  pkg-config --exists check      && ok "Check"      "check $(pkg-config --modversion check)"           || ko "Check"      "pkg-config check absent"
  pkg-config --exists expat      && ok "Expat"      "expat $(pkg-config --modversion expat)"           || ko "Expat"      "pkg-config expat absent"
  pkg-config --exists gdbm       && ok "GDBM"       "gdbm $(pkg-config --modversion gdbm)"             || ko "GDBM"       "pkg-config gdbm absent"
  pkg-config --exists gmp        && ok "GMP"        "gmp $(pkg-config --modversion gmp)"               || ko "GMP"        "pkg-config gmp absent"
  pkg-config --exists libpipeline&& ok "Libpipeline""libpipeline $(pkg-config --modversion libpipeline)"|| ko "Libpipeline""pkg-config libpipeline absent"
  pkg-config --exists mpc        && ok "MPC"        "mpc $(pkg-config --modversion mpc)"               || ko "MPC"        "pkg-config mpc absent"
  pkg-config --exists mpfr       && ok "MPFR"       "mpfr $(pkg-config --modversion mpfr)"            || ko "MPFR"       "pkg-config mpfr absent"
  (pkg-config --exists ncursesw && ok "Ncurses" "ncursesw $(pkg-config --modversion ncursesw)") \
    || (pkg-config --exists ncurses && ok "Ncurses" "ncurses $(pkg-config --modversion ncurses)") \
    || ko "Ncurses" "pkg-config ncurses(w) absent"
  pkg-config --exists readline   && ok "Readline"   "readline $(pkg-config --modversion readline)"    || ko "Readline"   "pkg-config readline absent"
  pkg-config --exists zlib       && ok "Zlib"       "zlib $(pkg-config --modversion zlib)"            || ko "Zlib"       "pkg-config zlib absent"
else
  ko "pkg-config" "absent (impossible de vérifier libs via pkg-config)"
fi

if have perl; then
  perl -MXML::Parser -e 'print $XML::Parser::VERSION, "\n"' >/dev/null 2>&1 \
    && ok "XML::Parser" "module Perl présent" \
    || ko "XML::Parser" "module Perl absent"
fi

hdr "Fichiers / données"
# Glibc
if have ldd; then ok "Glibc" "$(ldd --version 2>&1 | head -n 1)"; else ko "Glibc" "ldd absent"; fi
# Iana-Etc
if [ -f /etc/protocols ] && [ -f /etc/services ]; then ok "Iana-Etc" "/etc/protocols + /etc/services"; else ko "Iana-Etc" "fichiers manquants"; fi
# Man-pages (heuristique)
if [ -f /usr/share/man/man2/open.2 ] || [ -f /usr/share/man/man2/open.2.gz ]; then ok "Man-pages" "man2/open.2 présent"; else ko "Man-pages" "manpages man2 non trouvées"; fi
# Time Zone Data
if [ -f /usr/share/zoneinfo/UTC ]; then ok "TZData" "/usr/share/zoneinfo/UTC"; else ko "TZData" "zoneinfo/UTC absent"; fi
# Udev-lfs Tarball (heuristique : règles udev contenant 'LFS')
if [ -d /etc/udev/rules.d ] || [ -d /usr/lib/udev/rules.d ]; then
  r=$(grep -R "LFS" /etc/udev/rules.d /usr/lib/udev/rules.d 2>/dev/null | head -n 1)
  [ -n "$r" ] && ok "Udev-lfs" "règle trouvée: $(echo "$r" | cut -c1-80)..." || ok "Udev-lfs" "règles udev présentes (pas de tag 'LFS' trouvé)"
else
  ko "Udev-lfs" "répertoires de règles udev absents"
fi

hdr "Résultat"
if [ "$FAIL" -eq 0 ]; then
  echo "✅ Tout est présent selon ces checks."
else
  echo "❌ Échecs: $FAIL (voir lignes KO ci-dessus)."
fi

exit "$FAIL"
