# Defining the package namespace
%global ns_name ea
%global ns_dir /opt/cpanel

%global _scl_prefix %{ns_dir}
%global scl_name_base    %{ns_name}-php
%global scl_macro_base   %{ns_name}_php
%global scl_name_version 80
%global scl              %{scl_name_base}%{scl_name_version}
%scl_package %scl

# do not produce empty debuginfo package
%global debug_package %{nil}

Summary:       Package that installs PHP 8.0
Name:          %scl_name
Version:       8.0.25
Vendor:        cPanel, Inc.
# Doing release_prefix this way for Release allows for OBS-proof versioning, See EA-4590 for more details
%define        release_prefix 1
Release:       %{release_prefix}%{?dist}.cpanel
Group:         Development/Languages
License:       GPLv2+

Source0:       macros-build
Source1:       README
Source2:       LICENSE
Source3:       whm_feature_addon

BuildRoot:     %{_tmppath}/%{name}-%{version}-%{release}-root-%(%{__id_u} -n)
BuildRequires: scl-utils-build
BuildRequires: help2man
# Temporary work-around
BuildRequires: iso-codes

Requires:      %{?scl_prefix}php-common
Requires:      %{?scl_prefix}php-cli

# Our code requires that pear be installed when the meta package is installed
Requires:      %{?scl_prefix}pear

%description
This is the main package for %scl Software Collection,
that install PHP 8.0 language.


%package runtime
Summary:   Package that handles %scl Software Collection.
Group:     Development/Languages
Requires:  scl-utils

%description runtime
Package shipping essential scripts to work with %scl Software Collection.

%package build
Summary:   Package shipping basic build configuration
Group:     Development/Languages
Requires:  scl-utils-build

%description build
Package shipping essential configuration macros
to build %scl Software Collection.


%package scldevel
Summary:   Package shipping development files for %scl
Group:     Development/Languages

Provides:  ea-php-scldevel = %{version}
Conflicts: ea-php-scldevel > %{version}, ea-php-scldevel < %{version}

%description scldevel
Package shipping development files, especially usefull for development of
packages depending on %scl Software Collection.


%prep
%setup -c -T

cat <<EOF | tee enable
export PATH=%{_bindir}:%{_sbindir}\${PATH:+:\${PATH}}
export MANPATH=%{_mandir}:\${MANPATH}
EOF

# generate rpm macros file for depended collections
cat << EOF | tee scldev
%%scl_%{scl_macro_base}         %{scl}
%%scl_prefix_%{scl_macro_base}  %{scl_prefix}
EOF

# This section generates README file from a template and creates man page
# from that file, expanding RPM macros in the template file.
cat >README <<'EOF'
%{expand:%(cat %{SOURCE1})}
EOF

# copy the license file so %%files section sees it
cp %{SOURCE2} .


%build
# generate a helper script that will be used by help2man
cat >h2m_helper <<'EOF'
#!/bin/bash
[ "$1" == "--version" ] && echo "%{scl_name} %{version} Software Collection" || cat README
EOF
chmod a+x h2m_helper

# generate the man page
help2man -N --section 7 ./h2m_helper -o %{scl_name}.7


%install
[ "%{buildroot}" != "/" ] && rm -rf %{buildroot}

install -D -m 644 enable %{buildroot}%{_scl_scripts}/enable
install -D -m 644 scldev %{buildroot}%{_root_sysconfdir}/rpm/macros.%{scl_name_base}-scldevel
install -D -m 644 %{scl_name}.7 %{buildroot}%{_mandir}/man7/%{scl_name}.7
mkdir -p %{buildroot}/opt/cpanel/ea-php80/root/etc
mkdir -p %{buildroot}/opt/cpanel/ea-php80/root/usr/share/doc
mkdir -p %{buildroot}/opt/cpanel/ea-php80/root/usr/include
mkdir -p %{buildroot}/opt/cpanel/ea-php80/root/usr/share/man/man1
mkdir -p %{buildroot}/opt/cpanel/ea-php80/root/usr/bin
mkdir -p %{buildroot}/opt/cpanel/ea-php80/root/usr/var/cache
mkdir -p %{buildroot}/opt/cpanel/ea-php80/root/usr/var/tmp
mkdir -p %{buildroot}/opt/cpanel/ea-php80/root/usr/%{_lib}
mkdir -p %{buildroot}/usr/local/cpanel/whostmgr/addonfeatures
install %{SOURCE3} %{buildroot}/usr/local/cpanel/whostmgr/addonfeatures/%{name}

# Even if this package doesn't use it we need to do this because if another
# package does (e.g. pear licenses) it will be created and unowned by any RPM
%if 0%{?_licensedir:1}
mkdir %{buildroot}/%{_licensedir}
%endif

%scl_install

tmp_version=$(echo %{scl_name_version} | sed -re 's/([0-9])([0-9])/\1\.\2/')
sed -e 's/@SCL@/%{scl_macro_base}%{scl_name_version}/g' -e "s/@VERSION@/${tmp_version}/g" %{SOURCE0} \
  | tee -a %{buildroot}%{_root_sysconfdir}/rpm/macros.%{scl}-config

# Remove empty share/[man|locale]/ directories
find %{buildroot}/opt/cpanel/%{scl}/root/usr/share/man/ -type d -empty -delete
find %{buildroot}/opt/cpanel/%{scl}/root/usr/share/locale/ -type d -empty -delete
mkdir -p %{buildroot}/opt/cpanel/%{scl}/root/usr/share/locale

%clean
[ "%{buildroot}" != "/" ] && rm -rf %{buildroot}

%files


%files runtime
%defattr(-,root,root)
%doc README LICENSE
%scl_files
%{_mandir}/man7/%{scl_name}.*
%dir /opt/cpanel/ea-php80/root/etc
%dir /opt/cpanel/ea-php80/root/usr
%dir /opt/cpanel/ea-php80/root/usr/share
%dir /opt/cpanel/ea-php80/root/usr/share/doc
%dir /opt/cpanel/ea-php80/root/usr/include
%dir /opt/cpanel/ea-php80/root/usr/share/man
%dir /opt/cpanel/ea-php80/root/usr/bin
%dir /opt/cpanel/ea-php80/root/usr/var
%dir /opt/cpanel/ea-php80/root/usr/var/cache
%dir /opt/cpanel/ea-php80/root/usr/var/tmp
%dir /opt/cpanel/ea-php80/root/usr/%{_lib}
%attr(644, root, root) /usr/local/cpanel/whostmgr/addonfeatures/%{name}
%if 0%{?_licensedir:1}
%dir %{_licensedir}
%endif

%files build
%defattr(-,root,root)
%{_root_sysconfdir}/rpm/macros.%{scl}-config


%files scldevel
%defattr(-,root,root)
%{_root_sysconfdir}/rpm/macros.%{scl_name_base}-scldevel

%changelog
* Fri Oct 28 2022 Cory McIntire <cory@cpanel.net> - 8.0.25-1
- EA-11020: Update ea-php80 from v8.0.24 to v8.0.25

* Fri Sep 30 2022 Cory McIntire <cory@cpanel.net> - 8.0.24-1
- EA-10961: Update ea-php80 from v8.0.23 to v8.0.24

* Thu Sep 01 2022 Cory McIntire <cory@cpanel.net> - 8.0.23-1
- EA-10915: Update ea-php80 from v8.0.22 to v8.0.23

* Thu Aug 04 2022 Cory McIntire <cory@cpanel.net> - 8.0.22-1
- EA-10864: Update ea-php80 from v8.0.21 to v8.0.22

* Thu Jul 07 2022 Cory McIntire <cory@cpanel.net> - 8.0.21-1
- EA-10820: Update ea-php80 from v8.0.20 to v8.0.21

* Fri Jun 10 2022 Cory McIntire <cory@cpanel.net> - 8.0.20-1
- EA-10760: Update ea-php80 from v8.0.19 to v8.0.20

* Thu May 12 2022 Cory McIntire <cory@cpanel.net> - 8.0.19-1
- EA-10703: Update ea-php80 from v8.0.18 to v8.0.19

* Fri Apr 15 2022 Cory McIntire <cory@cpanel.net> - 8.0.18-1
- EA-10636: Update ea-php80 from v8.0.17 to v8.0.18

* Thu Mar 17 2022 Cory McIntire <cory@cpanel.net> - 8.0.17-1
- EA-10575: Update ea-php80 from v8.0.16 to v8.0.17

* Fri Feb 18 2022 Cory McIntire <cory@cpanel.net> - 8.0.16-1
- EA-10505: Update ea-php80 from v8.0.15 to v8.0.16

* Thu Jan 20 2022 Cory McIntire <cory@cpanel.net> - 8.0.15-1
- EA-10447: Update ea-php80 from v8.0.14 to v8.0.15

* Tue Dec 28 2021 Dan Muey <dan@cpanel.net> - 8.0.14-2
- ZC-9589: Update DISABLE_BUILD to match OBS

* Fri Dec 17 2021 Cory McIntire <cory@cpanel.net> - 8.0.14-1
- EA-10365: Update ea-php80 from v8.0.13 to v8.0.14

* Fri Nov 19 2021 Cory McIntire <cory@cpanel.net> - 8.0.13-1
- EA-10284: Update ea-php80 from v8.0.12 to v8.0.13

* Thu Oct 21 2021 Cory McIntire <cory@cpanel.net> - 8.0.12-1
- EA-10225: Update ea-php80 from v8.0.11 to v8.0.12

* Thu Sep 23 2021 Cory McIntire <cory@cpanel.net> - 8.0.11-1
- EA-10130: Update ea-php80 from v8.0.10 to v8.0.11

* Thu Aug 26 2021 Travis Holloway <t.holloway@cpanel.net> - 8.0.10-1
- EA-10080: Update ea-php80 from v8.0.9 to v8.0.10

* Thu Jul 29 2021 Cory McIntire <cory@cpanel.net> - 8.0.9-1
- EA-10010: Update ea-php80 from v8.0.8 to v8.0.9

* Thu Jul 01 2021 Travis Holloway <t.holloway@cpanel.net> - 8.0.8-1
- EA-9930: Update ea-php80 from v8.0.7 to v8.0.8

* Mon Jun 28 2021 Travis Holloway <t.holloway@cpanel.net> - 8.0.7-2
- EA-9013: Optimize %check section

* Fri Jun 04 2021 Cory McIntire <cory@cpanel.net> - 8.0.7-1
- EA-9832: Update ea-php80 from v8.0.6 to v8.0.7

* Mon May 10 2021 Cory McIntire <cory@cpanel.net> - 8.0.6-1
- EA-9762: Update ea-php80 from v8.0.5 to v8.0.6

* Thu Apr 29 2021 Cory McIntire <cory@cpanel.net> - 8.0.5-1
- EA-9732: Update ea-php80 from v8.0.3 to v8.0.5

* Thu Mar 04 2021 Cory McIntire <cory@cpanel.net> - 8.0.3-1
- EA-9623: Update ea-php80 from v8.0.2 to v8.0.3

* Fri Feb 05 2021 Cory McIntire <cory@cpanel.net> - 8.0.2-1
- EA-9574: Update ea-php80 from v8.0.1 to v8.0.2

* Thu Jan 07 2021 Tim Mullin <tim@cpanel.net> - 8.0.1-1
- EA-9519: Update ea-php80 from v8.0.0 to v8.0.1

* Mon Nov 30 2020 Daniel Muey <dan@cpanel.net> - 8.0.0-2
- ZC-7880: Move PHP 8.0 to production

* Thu Nov 26 2020 Daniel Muey <dan@cpanel.net> - 8.0.0-1
- EA-9443: Update ea-php80 from v8.0.0rc4 to v8.0.0

* Wed Nov 11 2020 Daniel Muey <dan@cpanel.net> - 8.0.0rc4-1
- ZC-7862: Update to RC4

* Thu Oct 29 2020 Daniel Muey <dan@cpanel.net> - 8.0.0RC3-1
- ZC-7310: Update to RC3

* Tue Sep 22 2020 Daniel Muey <dan@cpanel.net> - 8.0.0beta4-1
- ZC-7523: Update to beta 4

* Mon Jul 27 2020 Julian Brown <julian.brown@cpanel.net> - 8.0.0alpha3-1
- ZC-7203: Revert blocking php-pear, and indicate we are using alpha3 now.

* Tue Jul 14 2020 Daniel Muey <dan@cpanel.net> - 8.0.0alpha2-1
- ZC-7164: Initial packaging
