FROM centos:centos7

ENV NODE_VERSION=16.20.0

RUN yum -y install epel-release centos-release-scl \
  curl python3 make atk-devel atk java-atk-wrapper \
  at-spi2-atk gtk3 libXt libdrm mesa-libgbm Xvfb \
  devtoolset-8-gcc devtoolset-8-gcc-c++ GConf2 nss \
  xorg-x11-server-Xvfb gtk2-devel gtk3-devel libnotify-devel \
  libXScrnSaver alsa-lib \
  && yum clean all

# fom Cypress centos7 builder image
RUN echo >> /etc/profile.d/devtoolset-8.sh 'source scl_source enable devtoolset-8'
RUN ["bin/bash", "-c", "set -o pipefail && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash - "]
RUN echo >> /etc/profile.d/nvm.sh 'source ~/.nvm/nvm.sh'
# Node 16 is the most recent version that supports CentOS 7. We only need it to
# re-build better-sqlite, so there should be minimal risk of security issues.
RUN . ~/.nvm/nvm.sh && nvm install ${NODE_VERSION} && npm install -g yarn


RUN mkdir -p /app
COPY ./src /app
WORKDIR /app
RUN . ~/.nvm/nvm.sh && npm -y install

CMD [ "bash", "-c", "./runme.sh" ]
