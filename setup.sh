#!/usr/bin/env sh

#s6
apk add --no-cache --purge -uU curl
VERSION=$(curl -SL https://api.github.com/repos/just-containers/s6-overlay/releases/latest | awk '/tag_name/{print $4;exit}' FS='[""]' | sed -e 's_v__')
echo "using s6 version: $VERSION"
curl -o /tmp/s6-overlay-amd64.tar.gz -jkSL https://github.com/just-containers/s6-overlay/releases/download/v${VERSION}/s6-overlay-amd64.tar.gz
tar xzf /tmp/s6-overlay-amd64.tar.gz -C /
apk del --purge curl
rm -rf /var/cache/apk/* /tmp/*

#Database
apk add --no-cache mariadb

# Build deps
apk add -q --no-cache --virtual .build-deps git npm python-dev make g++

#npm
apk add --no-cache nodejs

MAILTRAIN_VERSION="1.24.1"

wget https://github.com/Mailtrain-org/mailtrain/archive/v${MAILTRAIN_VERSION}.tar.gz
tar zxvf v${MAILTRAIN_VERSION}.tar.gz
cd mailtrain-${MAILTRAIN_VERSION}

npm install --no-progress --production
npm install --no-progress passport-ldapjs passport-ldapauth


cd /
mv mailtrain-${MAILTRAIN_VERSION} mailtrain
rm v${MAILTRAIN_VERSION}.tar.gz

#apk del -q --purge .build-deps

##
#
#
#
#
#
#
## Build deps
#apk add -q --no-cache --virtual .build-deps bzr curl gcc git go libffi-dev linux-headers make musl-dev openssl-dev python-dev py-pip wget
#apk add -q --no-cache bash ca-certificates iptables ip6tables openssl openvpn procps py-setuptools py-dnspython tzdata
#
#pip install --upgrade pip
#
## Pritunl Install
#export GOPATH=/go
#go get github.com/pritunl/pritunl-dns
#go get github.com/pritunl/pritunl-monitor
#go get github.com/pritunl/pritunl-web
#cp /go/bin/* /usr/bin/
#rm -rf ${GOPATH}
#
#MAILTRAIN_VERSION="1.29.2145.25"
#
#wget https://github.com/pritunl/pritunl/archive/${MAILTRAIN_VERSION}.tar.gz
#tar zxvf ${MAILTRAIN_VERSION}.tar.gz
#cd pritunl-${MAILTRAIN_VERSION}
#python setup.py build
#pip install -r requirements.txt
#python2 setup.py install
#cd ..
#rm -rf *${MAILTRAIN_VERSION}*
#rm -rf /tmp/* /var/cache/apk/*
#
#sed -i -e '/^attributes/a prompt\t\t\t= yes' /etc/ssl/openssl.cnf
#sed -i -e '/countryName_max/a countryName_value\t\t= US' /etc/ssl/openssl.cnf
#
##mongodb
#apk add --no-cache mongodb
#
##cleanup
#apk del -q --purge .build-deps
#
#
#
