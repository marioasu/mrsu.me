#!/bin/bash
set -e

[[ -n $DEBUG_ENTRYPOINT ]] && set -x

USER=www-data
groupmod -g ${USER_GID:-1000} $USER
usermod -u ${USER_ID:-1000} $USER

nginx_conf_d=/etc/nginx/host.d
sed -i "s#%DOMAIN_NAME%#$DOMAIN_NAME#g" $nginx_conf_d/*.conf
sed -i "s#%WEB_HOME%#$WEB_HOME#g" $nginx_conf_d/*.conf
