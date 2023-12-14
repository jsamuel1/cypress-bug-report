#!/bin/bash

majorver=$(cut -d: -f5 /etc/system-release-cpe)
subscription-manager register
subscription-manager repos --enable codeready-builder-for-rhel-${majorver}-$(arch)-rpms
dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-${majorver}.noarch.rpm
dnf -y install dnf-plugins-core
dnf -y install xorg-x11-server-Xvfb gtk2-devel gtk3-devel libnotify-devel GConf2 nss libXScrnSaver alsa-lib
dnf -y install neovim

npm -y install
