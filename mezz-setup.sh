#!/bin/bash -x

# here we install various things that don't change often (yearly or so?) but are not native OS packages

JETBRAINS_VERSION=2019.1.1-jbr11
ALACRITTY_VERSION=v0.2.9
OPENJDK_VERSION=12
CODE_SERVER_VERSION=1.939-vsc1.33.1
GCLOUD_SDK_VERSION=244.0.0
TERRAFORM_VERSION=0.12.0

cd /tmp
wget -nv https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && dpkg -i google-chrome-stable_current_amd64.deb
wget -nv https://download.java.net/java/GA/jdk${OPENJDK_VERSION}/GPL/openjdk-${OPENJDK_VERSION}_linux-x64_bin.tar.gz && tar xfz /tmp/openjdk-${OPENJDK_VERSION}_linux-x64_bin.tar.gz -C /opt && ln -sf /opt/jdk-${OPENJDK_VERSION} /opt/java
wget -nv https://github.com/jwilm/alacritty/releases/download/${ALACRITTY_VERSION}/Alacritty-${ALACRITTY_VERSION}_amd64.deb && dpkg -i Alacritty-${ALACRITTY_VERSION}_amd64.deb
wget -nv https://github.com/cdr/code-server/releases/download/${CODE_SERVER_VERSION}/code-server${CODE_SERVER_VERSION}-linux-x64.tar.gz; tar xfz code-server${CODE_SERVER_VERSION}-linux-x64.tar.gz; cp code-server${CODE_SERVER_VERSION}-linux-x64/code-server /usr/bin/
wget -nv https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${GCLOUD_SDK_VERSION}-linux-x86_64.tar.gz && tar xfz google-cloud-sdk-${GCLOUD_SDK_VERSION}-linux-x86_64.tar.gz -C /opt
#this will track latest
curl -L https://aka.ms/InstallAzureCLIDeb | bash
wget -nv https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && mv -f terraform /usr/bin/
