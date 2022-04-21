FROM registry.redhat.io/rhel8/nodejs-16

USER 0

# Install latest chrome dev package and fonts to support major charsets (Chinese, Japanese, Arabic, Hebrew, Thai and a few others)
# Note: this installs the necessary libs to make the bundled version of Chromium that Puppeteer
# installs, work.
SHELL ["/bin/bash", "-c"]
RUN echo $'[google-chrome]\n\
name=google-chrome\n\
baseurl=http://dl.google.com/linux/chrome/rpm/stable/$basearch\n\
enabled=1\n\
gpgcheck=1\n\
gpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub' > /etc/yum.repos.d/google-chrome.repo

RUN yum makecache \
  && yum install -y google-chrome-stable libXScrnSaver
# fipa-gothic-fonts wqy-zenhei-fonts thai-scalable-tlwgtypo-fonts kacst-one-fonts fonts-freefont-ttf

USER 1001:0
