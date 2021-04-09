#!/bin/bash
set -e

if [[ -z $DNS ]] && [[ -z $PORT ]]; then
   echo "Please set parameter value that DNS and PORT."
   exit -1
fi

cat /templates/nginx.conf | sed 's/##PORT##/'"$PORT"'/g' | sed 's/##DNS##/'"$DNS"'/g' > /usr/local/nginx/conf/nginx.conf


exec /usr/local/nginx/sbin/nginx -g 'daemon off;'
