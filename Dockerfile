FROM centos:centos7
# RUN yum -y update; yum clean all
RUN ulimit -n 1024000 && yum -y install epel-release
RUN ulimit -n 1024000 && yum -y install dnf
RUN ulimit -n 1024000 && dnf -y install dnf-plugins-core

RUN ulimit -n 1024000 && dnf -y install xorg-x11-server-Xvfb gtk2-devel gtk3-devel libnotify-devel GConf2 nss libXScrnSaver alsa-lib
#RUN ulimit -n 1024000 && dnf -y copr enable konimex/neofetch
#RUN ulimit -n 1024000 && dnf -y install neofetch neovim

RUN echo >> /etc/profile.d/devtoolset-8.sh 'source scl_source enable devtoolset-8'
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash
RUN echo >> /etc/profile.d/nvm.sh 'source ~/.nvm/nvm.sh'
# Node 16 is the most recent version that supports CentOS 7. We only need it to
# re-build better-sqlite, so there should be minimal risk of security issues.
RUN source ~/.nvm/nvm.sh && nvm install 16.20.2 && npm install -g yarn


RUN mkdir -p /app
ADD ./src /app
WORKDIR /app
RUN source ~/.nvm/nvm.sh && npm -y install

CMD [ 'runme.sh' ]
