#!/bin/bash

# CIS Apache HTTP Server 2.4 Benchmark, Section 3.1
# Add default user and prepare httpd
useradd -u 1001 -r -g 0 -d ${HOME} -c "Default Application User" default

mkdir -p ${HTTPD_MAIN_CONF_PATH}
chmod -R a+rwx ${HTTPD_MAIN_CONF_PATH}
mkdir -p ${HTTPD_MAIN_CONF_D_PATH}
chmod -R a+rwx ${HTTPD_MAIN_CONF_D_PATH}
mkdir -p ${HTTPD_MAIN_CONF_MODULES_D_PATH}
chmod -R a+rwx ${HTTPD_MAIN_CONF_MODULES_D_PATH}
chmod -R a+rwx ${HTTPD_VAR_RUN}
chown -R 1001:0 ${HTTPD_DATA_PATH}

# remove bundled key pair and create new dir, where we store it
mkdir -p $HTTPD_TLS_CERT_PATH
chmod -R a+rwx $HTTPD_TLS_CERT_PATH

# Same links as in /etc/httpd
ln -sf /var/log/httpd ${HTTPD_SERVER_ROOT_PATH}/logs
ln -sf /usr/lib64/httpd/modules ${HTTPD_SERVER_ROOT_PATH}/modules
ln -sf /run/httpd ${HTTPD_SERVER_ROOT_PATH}/run
ln -sf /var/lib/httpd ${HTTPD_SERVER_ROOT_PATH}/state

# Adding script folder for runtime pre-init execution
mkdir -p ${HTTPD_SERVER_ROOT_PATH}/scripts
mkdir -p ${HTTPD_SERVER_ROOT_PATH}/scripts/extras
chmod -R a+rwx ${HTTPD_SERVER_ROOT_PATH}/scripts/extras

ln -sf /etc/httpd/conf/magic ${HTTPD_MAIN_CONF_PATH}/magic